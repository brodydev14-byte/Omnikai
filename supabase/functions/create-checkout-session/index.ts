/* ════════════════════════════════════════════════════════════════
   Omnikai — start a Warrior subscription.

   Called from plans.html when a signed-in user picks the paid tier.
   Returns { url } for the browser to redirect to Stripe Checkout.

   This function never decides anyone's tier. It only opens checkout;
   stripe-webhook is what actually moves `plan`. That split matters —
   a user can close the tab mid-payment, and the webhook is the only
   thing that sees how it really ended.
   ════════════════════════════════════════════════════════════════ */
import Stripe from 'https://esm.sh/stripe@18?target=deno';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { corsHeaders, json } from '../_shared/cors.ts';

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, {
  httpClient: Stripe.createFetchHttpClient(),
});

const PRICE_ID = Deno.env.get('STRIPE_PRICE_WARRIOR')!;
const SITE_URL = Deno.env.get('SITE_URL')!;

/** Where Stripe sends the user back to after a successful payment.
    Subscribing happens at two different moments and they need different
    landing pages: mid-onboarding the user still has to finish setup, and
    dropping them on the dashboard would just bounce them back to plans.html
    (omni-auth.js sends anyone without omniSetupComplete to the start of the
    chain) — an infinite loop for someone who has just paid.

    The caller picks, but only from this list. An unvalidated return path
    would turn the success_url into an open redirect. */
const RETURN_PAGES = new Set(['dashboard.html', 'setup.html', 'profile.html']);
const DEFAULT_RETURN = 'dashboard.html';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  if (req.method !== 'POST') return json({ error: 'method not allowed' }, 405);

  try {
    // The one thing the body is allowed to influence, and only via the
    // allowlist above. A malformed or absent body is not an error.
    const requested = await req.json().then((b) => b?.returnPage).catch(() => null);
    const returnPage = RETURN_PAGES.has(requested) ? requested : DEFAULT_RETURN;

    // ── Identify the caller ──────────────────────────────────────
    // The user's JWT is the only thing we trust here. Nothing about
    // who is being subscribed comes from the request body.
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) return json({ error: 'not signed in' }, 401);

    const userClient = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } },
    );

    const { data: { user }, error: userErr } = await userClient.auth.getUser();
    if (userErr || !user) return json({ error: 'not signed in' }, 401);

    // Service role: the billing columns are closed to the client, so
    // reading and writing them has to happen with the elevated key.
    const admin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    const { data: profile } = await admin
      .from('profiles')
      .select('plan, stripe_customer_id')
      .eq('id', user.id)
      .maybeSingle();

    // Already paying — don't open a second subscription.
    if (profile?.plan === 'warrior') {
      return json({ error: 'already subscribed' }, 409);
    }

    // ── Find or create the Stripe customer ───────────────────────
    // Reusing the customer keeps one billing history per person even if
    // they subscribe, cancel, and come back months later.
    let customerId = profile?.stripe_customer_id ?? null;

    if (!customerId) {
      const customer = await stripe.customers.create({
        email: user.email ?? undefined,
        // Lets the webhook recover the user even if a Checkout Session's
        // metadata is somehow missing.
        metadata: { supabase_uid: user.id, app: 'omnikai' },
      });
      customerId = customer.id;

      const { error: saveErr } = await admin
        .from('profiles')
        .update({ stripe_customer_id: customerId })
        .eq('id', user.id);

      // If we can't persist the id we'd orphan this customer and make a
      // fresh one on every attempt, so fail loudly rather than continue.
      if (saveErr) {
        console.error('could not save stripe_customer_id:', saveErr.message);
        return json({ error: 'could not start checkout' }, 500);
      }
    }

    // ── Open Checkout ────────────────────────────────────────────
    const session = await stripe.checkout.sessions.create({
      mode: 'subscription',
      customer: customerId,
      line_items: [{ price: PRICE_ID, quantity: 1 }],
      // Both are belt and braces for the webhook's user lookup.
      client_reference_id: user.id,
      subscription_data: { metadata: { supabase_uid: user.id } },
      allow_promotion_codes: true,
      // SITE_URL is server-side config, never a client-supplied origin —
      // otherwise this is an open redirect wearing a Stripe badge. The page
      // within it is caller-chosen but allowlisted above.
      success_url: `${SITE_URL}/${returnPage}?checkout=success`,
      cancel_url: `${SITE_URL}/plans.html?checkout=cancelled`,
    });

    return json({ url: session.url });
  } catch (e) {
    console.error('create-checkout-session failed:', e);
    return json({ error: 'could not start checkout' }, 500);
  }
});
