/* ════════════════════════════════════════════════════════════════
   Omnikai — premium content loader

   The intermediate and advanced sessions used to ship their drills
   inside the .html file, with a line of JavaScript blanking the page
   for free users. That hid the content without protecting it: the
   browser had already been handed everything, so view-source defeated
   the paywall entirely.

   Now each of those pages is an empty shell and the drills live in the
   premium_content table, which Postgres only lets a Warrior read (see
   the 20261015000000 migration). A Wanderer's query comes back empty,
   so there is nothing to reveal.

   Each page calls:
     OmniPremium.load('bjj_advanced_a');

   Load order in <head>, after omni-auth.js:
     <script src="omni-auth.js"></script>
     <script src="omni-premium.js"></script>
   ════════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  var CONTAINER = '.scroll-wrap';

  /* The upsell shown when there's no content to show — whether that's
     because the user isn't a Warrior, isn't signed in, or the request
     failed. Deliberately identical in all three cases: the page should
     never hint at the difference between "not allowed" and "not found". */
  function paywallHtml() {
    return '' +
      '<div style="padding:40px 20px;text-align:center;">' +
        '<div style="font-size:3rem;margin-bottom:16px;">🏆</div>' +
        '<div style="font-family:\'Bebas Neue\',sans-serif;font-size:1.6rem;letter-spacing:0.06em;color:#ffd700;margin-bottom:8px;">Elite — Warrior Exclusive</div>' +
        '<div style="font-family:\'Inter\',sans-serif;font-size:0.85rem;color:var(--muted);margin-bottom:24px;line-height:1.6;">These sessions are available to Warrior members only.</div>' +
        '<button onclick="window.location.href=\'plans.html\'" style="background:#ffd700;border:none;border-radius:10px;padding:14px 28px;color:#080b10;font-family:\'Bebas Neue\',sans-serif;font-size:1rem;letter-spacing:0.15em;cursor:pointer;">Upgrade to Warrior →</button>' +
        '<br/><br/>' +
        '<a href="library.html" style="color:var(--muted);font-size:0.8rem;">← Back to Library</a>' +
      '</div>';
  }

  function loadingHtml() {
    return '' +
      '<div style="padding:60px 20px;text-align:center;color:var(--muted);' +
      'font-family:\'Inter\',sans-serif;font-size:0.8rem;">Loading session…</div>';
  }

  function render(html) {
    var el = document.querySelector(CONTAINER);
    // A page missing its container would otherwise throw here and leave
    // whatever markup was already on screen — fail loudly in the console
    // instead, since silently showing something is the worse outcome.
    if (!el) {
      console.error('[Omnikai] premium loader: no ' + CONTAINER + ' on this page');
      return;
    }
    el.innerHTML = html;
  }

  window.OmniPremium = {
    /**
     * Fetch and render this page's session.
     * @param {string} slug row key in premium_content, e.g. 'bjj_advanced_a'
     */
    load: function (slug) {
      render(loadingHtml());

      if (!window.OmniAuth || !window.OmniAuth.configured) {
        console.error('[Omnikai] premium loader: OmniAuth unavailable');
        render(paywallHtml());
        return;
      }

      // Wait for the session to resolve before querying — omni-auth.js
      // attaches the access token, and without it the row is invisible
      // even to a paying member.
      return OmniAuth.ready
        .then(function () {
          return OmniAuth.client
            .from('premium_content')
            .select('html')
            .eq('slug', slug)
            .maybeSingle();
        })
        .then(function (res) {
          if (res.error) {
            console.warn('[Omnikai] premium load failed:', res.error.message);
            render(paywallHtml());
            return;
          }
          // No row means not entitled: the policy filtered it out rather
          // than raising, which is how row-level security reads to a client.
          if (!res.data || !res.data.html) {
            render(paywallHtml());
            return;
          }
          render(res.data.html);
        })
        .catch(function (e) {
          console.error('[Omnikai] premium load error:', e);
          render(paywallHtml());
        });
    },
  };
})();
