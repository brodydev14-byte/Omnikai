/* ════════════════════════════════════════════════════════════════
   Omnikai — authentication + profile sync

   Loaded on every page. Two jobs:

   1. GATE — on protected pages, confirm there's a real Supabase session
      before showing anything. No session, no page.

   2. SYNC — the app's ~170 pages all read and write sessionStorage
      (omniName, omniArts, omniBody, ...). Rather than rewrite each one,
      this module treats sessionStorage as a local working copy: it
      hydrates it from the server on load, and pushes changes back
      automatically. Existing page code keeps working untouched.

   Load order in <head>, before anything renders:
     <script src="omni-config.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
     <script src="omni-auth.js"></script>
   ════════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  // Pages reachable without a session. Everything else is gated.
  var PUBLIC_PAGES = ['index.html', 'reset-password.html', ''];

  // The onboarding chain: plans → setup → equipment → body → dashboard.
  // A signed-in user who hasn't finished it gets sent back to the start,
  // so confirming an email link can't drop them into an empty dashboard.
  var ONBOARDING_PAGES = ['plans.html', 'setup.html', 'equipment.html', 'body.html'];

  // The app splits its data across both web storages, so we sync both and
  // restore each key to the home its pages expect.
  //
  // Excluded on purpose: omniName and omniPlan (their own columns), and
  // omniTheme (a per-device display preference — it should NOT follow you
  // between devices).
  var SESSION_KEYS = [
    'omniArts', 'omniBody', 'omniEquipment', 'omniGymAccess',
    'omniWorkouts', 'omniSetupComplete',
  ];
  var LOCAL_KEYS = [
    'omniStreak', 'omniHistory', 'omniPRs', 'omniAchievements',
    'omniLastWorkoutDate', 'omniVisitedConditioning',
  ];
  // Read from both storages depending on the page, so it's written to both.
  var DUAL_KEYS = ['omniWorkouts'];

  /* The food log can't be a fixed key above: nutrition.html writes one
     localStorage entry per day, named omniFood_Tue_Oct_21_2026. Because the
     lists above are fixed, those keys were never collected and the food log
     never left the device -- log breakfast on your phone and your laptop knew
     nothing about it.

     They're gathered dynamically instead, newest first and capped. The cap
     matters: profiles.state is pushed whole on every change, so a year of
     daily logs would grow that payload without limit for no benefit. Days
     older than the window stay on whichever device logged them rather than
     being deleted. */
  var FOOD_PREFIX = 'omniFood_';
  var FOOD_SYNC_DAYS = 60;

  function foodKeysToSync() {
    var entries = [];
    for (var i = 0; i < localStorage.length; i++) {
      var k = localStorage.key(i);
      if (!k || k.indexOf(FOOD_PREFIX) !== 0) continue;
      // 'omniFood_Tue_Oct_21_2026' -> 'Tue Oct 21 2026', which Date can read.
      var t = Date.parse(k.slice(FOOD_PREFIX.length).replace(/_/g, ' '));
      entries.push({ key: k, time: isNaN(t) ? 0 : t });
    }
    // Newest first, so an unparseable key loses its place rather than the
    // window it would have displaced.
    entries.sort(function (a, b) { return b.time - a.time; });
    return entries.slice(0, FOOD_SYNC_DAYS).map(function (e) { return e.key; });
  }

  var cfg = window.OMNI_CONFIG || {};
  var configured =
    cfg.SUPABASE_URL &&
    cfg.SUPABASE_URL.indexOf('PASTE_') !== 0 &&
    cfg.SUPABASE_ANON_KEY &&
    cfg.SUPABASE_ANON_KEY.indexOf('PASTE_') !== 0;

  var page = location.pathname.split('/').pop().toLowerCase();
  var isPublic = PUBLIC_PAGES.indexOf(page) !== -1;

  /* ── Anti-flash ────────────────────────────────────────────────
     Hide the document immediately so protected content never paints
     before we know who's looking. Revealed once auth resolves, with a
     failsafe in case the network or CDN never answers.             */
  var revealed = false;
  function reveal() {
    if (revealed) return;
    revealed = true;
    document.documentElement.style.visibility = '';
  }
  if (!isPublic) {
    document.documentElement.style.visibility = 'hidden';
    // If the auth check never answers, fail closed — send them to the login
    // page rather than revealing a protected page we couldn't verify.
    setTimeout(function () {
      if (!revealed) location.replace('index.html');
    }, 8000);
  }

  if (!configured) {
    console.error(
      '[Omnikai] Supabase is not configured. Fill in omni-config.js — ' +
      'until then, auth is disabled and pages are unprotected.'
    );
    reveal();
    window.OmniAuth = { configured: false };
    return;
  }

  var sb = window.supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY, {
    auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: true },
  });

  var currentUser = null;
  var syncTimer = null;
  var suppressSync = false;

  /* ── Storage write hooks ───────────────────────────────────────
     Wrap setItem on both storages so any existing page that saves
     progress also schedules a push to the server. This is what keeps
     the ~160 pages working without touching their data access. */
  var nativeSetItem = Storage.prototype.setItem;

  function hook(store) {
    store.setItem = function (key, value) {
      nativeSetItem.call(this, key, value);
      // omniTheme is device-local; changing it shouldn't hit the network.
      if (!suppressSync && currentUser && String(key).indexOf('omni') === 0 && key !== 'omniTheme') {
        scheduleSync();
      }
    };
  }
  hook(sessionStorage);
  hook(localStorage);

  function scheduleSync() {
    clearTimeout(syncTimer);
    syncTimer = setTimeout(pushProfile, 800);
  }

  function collectState() {
    var state = {};
    SESSION_KEYS.forEach(function (k) {
      var v = sessionStorage.getItem(k);
      if (v !== null) state[k] = v;
    });
    LOCAL_KEYS.forEach(function (k) {
      var v = localStorage.getItem(k);
      if (v !== null) state[k] = v;
    });
    foodKeysToSync().forEach(function (k) {
      var v = localStorage.getItem(k);
      if (v !== null) state[k] = v;
    });
    return state;
  }

  /** Put a synced key back in whichever storage the app reads it from. */
  function restore(key, value) {
    // omniName has its own column but pages read it from sessionStorage.
    // omniPlan is deliberately not restored from local data — the server
    // is the only authority on which tier someone is on.
    if (key === 'omniName')               nativeSetItem.call(sessionStorage, key, value);
    if (SESSION_KEYS.indexOf(key) !== -1) nativeSetItem.call(sessionStorage, key, value);
    if (LOCAL_KEYS.indexOf(key) !== -1)   nativeSetItem.call(localStorage, key, value);
    if (DUAL_KEYS.indexOf(key) !== -1)    nativeSetItem.call(localStorage, key, value);
    // Daily food logs, matched by prefix since the date is part of the name.
    if (key.indexOf(FOOD_PREFIX) === 0)   nativeSetItem.call(localStorage, key, value);
  }

  /** Write the local working copy up to Supabase. */
  function pushProfile() {
    if (!currentUser) return Promise.resolve();
    // `plan` is intentionally omitted — the database rejects client
    // changes to it (see the guard_plan trigger in supabase-schema.sql).
    return sb.from('profiles')
      .update({
        name: sessionStorage.getItem('omniName') || 'Warrior',
        state: collectState(),
      })
      .eq('id', currentUser.id)
      .then(function (res) {
        if (res.error) console.warn('[Omnikai] profile save failed:', res.error.message);
      });
  }

  /** Create this user's profile row on first login. */
  function createProfile() {
    var meta = currentUser.user_metadata || {};
    var row = {
      id: currentUser.id,
      name: meta.name || meta.full_name || 'Warrior',
      plan: 'wanderer',
      state: {},
    };
    return sb.from('profiles').insert(row).select('name, plan, state').maybeSingle()
      .then(function (res) {
        if (res.error) {
          console.warn('[Omnikai] could not create profile:', res.error.message);
          // Fall back to defaults so the app still works this session.
          return { name: row.name, plan: row.plan, state: {} };
        }
        console.info('[Omnikai] created your profile.');
        return res.data;
      });
  }

  /** Pull the server profile into sessionStorage, creating it if absent.
      Normally a database trigger would create the row at signup, but the
      Supabase SQL editor can't create triggers, so the client does it on
      first login instead. The "insert own profile" RLS policy still means
      a user can only ever create their own row. */
  function pullProfile() {
    return sb.from('profiles').select('name, plan, state').eq('id', currentUser.id).maybeSingle()
      .then(function (res) {
        if (res.error) {
          console.warn('[Omnikai] profile load failed:', res.error.message);
          return null;
        }
        if (!res.data) return createProfile();
        return res.data;
      })
      .then(function (p) {
        if (!p) return null;
        suppressSync = true;
        nativeSetItem.call(sessionStorage, 'omniName', p.name || 'Warrior');
        nativeSetItem.call(sessionStorage, 'omniPlan', p.plan || 'wanderer');
        Object.keys(p.state || {}).forEach(function (k) {
          restore(k, p.state[k]);
        });
        suppressSync = false;
        return p;
      });
  }

  /* ── One-time migration ────────────────────────────────────────
     Users from before real accounts existed have their whole profile
     in the localStorage `omniData` blob. On first login, if the server
     profile is still empty, adopt that local data instead of wiping it. */
  function migrateLegacyData(profile) {
    var serverEmpty = !profile || !profile.state || Object.keys(profile.state).length === 0;
    if (!serverEmpty) return Promise.resolve();

    // Expand the old omniData blob back into the storages the pages read.
    // Loose localStorage keys (streak, PRs, history) are already in place and
    // get picked up by collectState() on the push below.
    var legacy = localStorage.getItem('omniData');
    if (legacy) {
      try {
        var data = JSON.parse(legacy);
        suppressSync = true;
        Object.keys(data).forEach(function (k) {
          if (data[k] != null) restore(k, data[k]);
        });
        suppressSync = false;
      } catch (e) {
        localStorage.removeItem('omniData');
      }
    }

    if (Object.keys(collectState()).length === 0) return Promise.resolve();
    console.info('[Omnikai] migrated your existing local profile into this account.');
    return pushProfile();
  }

  /* ── Boot ──────────────────────────────────────────────────────*/
  var ready = sb.auth.getSession().then(function (res) {
    var session = res.data.session;
    currentUser = session ? session.user : null;

    if (!currentUser) {
      if (!isPublic) {
        location.replace('index.html');
        return null;
      }
      reveal();
      return null;
    }

    // Signed in but sitting on the login page — go to the app.
    if (page === 'index.html') {
      location.replace('dashboard.html');
      return null;
    }

    return pullProfile()
      .then(migrateLegacyData)
      .then(function () {
        // Signed in but never finished onboarding — start them at the top of
        // the chain rather than showing a dashboard with no data behind it.
        var done = sessionStorage.getItem('omniSetupComplete') === 'true';
        if (!done && ONBOARDING_PAGES.indexOf(page) === -1) {
          location.replace('plans.html');
          return currentUser;
        }
        reveal();
        return currentUser;
      })
      .catch(function (e) { console.error('[Omnikai]', e); reveal(); return currentUser; });
  }).catch(function (e) {
    console.error('[Omnikai] auth check failed:', e);
    reveal();
    return null;
  });

  // Last-chance flush so a workout logged and immediately closed isn't lost.
  window.addEventListener('pagehide', function () {
    if (currentUser && syncTimer) { clearTimeout(syncTimer); pushProfile(); }
  });

  /* ── Billing ───────────────────────────────────────────────────
     Both calls hand off to an Edge Function and come back with a Stripe
     URL to send the browser to. Nothing about tier is decided here — the
     client can't write `plan` (the database rejects it), so the source of
     truth stays the stripe-webhook function. This is only the doorway. */
  function billingRedirect(fn, body) {
    if (!currentUser) return Promise.reject(new Error('not signed in'));
    // invoke() attaches the user's access token automatically, which is
    // what the function uses to decide whose subscription this is.
    return sb.functions.invoke(fn, { body: body || {} }).then(function (res) {
      if (res.error) throw new Error(res.error.message || 'billing request failed');
      if (!res.data || !res.data.url) throw new Error(res.data && res.data.error || 'no checkout URL');
      location.href = res.data.url;
    });
  }

  /* ── Public API ────────────────────────────────────────────────*/
  window.OmniAuth = {
    configured: true,
    client: sb,
    ready: ready,

    user: function () { return currentUser; },

    signUp: function (email, password, name) {
      return sb.auth.signUp({
        email: email,
        password: password,
        options: { data: { name: name }, emailRedirectTo: absUrl('dashboard.html') },
      });
    },

    signIn: function (email, password) {
      return sb.auth.signInWithPassword({ email: email, password: password });
    },

    signInWithGoogle: function () {
      return sb.auth.signInWithOAuth({
        provider: 'google',
        options: { redirectTo: absUrl('dashboard.html') },
      });
    },

    resetPassword: function (email) {
      return sb.auth.resetPasswordForEmail(email, { redirectTo: absUrl('reset-password.html') });
    },

    updatePassword: function (password) {
      return sb.auth.updateUser({ password: password });
    },

    save: pushProfile,

    /** Send the user to Stripe Checkout for the Warrior tier.
        Returns a promise that only rejects — on success the page navigates
        away. `returnPage` must be one the function allowlists. */
    startCheckout: function (returnPage) {
      return billingRedirect('create-checkout-session', { returnPage: returnPage });
    },

    /** Send the user to the Stripe billing portal to update a card, see
        invoices, or cancel. Cancelling there fires the webhook that puts
        them back on wanderer — there is no cancel path of our own. */
    openBillingPortal: function () {
      return billingRedirect('create-portal-session');
    },

    /** Whether this user is currently on the paid tier. Reads the value
        omni-auth pulled from the server, never a local guess. */
    isWarrior: function () {
      return sessionStorage.getItem('omniPlan') === 'warrior';
    },

    signOut: function () {
      return sb.auth.signOut().then(function () {
        sessionStorage.clear();
        localStorage.removeItem('omniData');
        location.replace('index.html');
      });
    },
  };

  function absUrl(file) {
    return location.origin + location.pathname.replace(/[^/]*$/, '') + file;
  }
})();
