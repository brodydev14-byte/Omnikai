/* ════════════════════════════════════════════════════════════════
   Omnikai — open the Stripe billing portal.

   "Cancel anytime" is already promised on plans.html. This is what
   makes that true: Stripe hosts the cancel / update-card / invoice
   history UI, and cancelling there fires a webhook that drops the
   user back to wanderer. No cancellation code of our own.
   ════════════════════════════════════════════════════════════════ */
import Stripe from 'https://esm.sh/stripe@18?target=deno';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { corsHeaders, json } from '../_shared/cors.ts';

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, {
  httpClient: Stripe.createFetchHttpClient(),
});

const SITE_URL = Deno.env.get('SITE_URL')!;

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  if (req.method !== 'POST') return json({ error: 'method not allowed' }, 405);

  try {
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) return json({ error: 'not signed in' }, 401);

    const userClient = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } },
    );

    const { data: { user }, error: userErr } = await userClient.auth.getUser();
    if (userErr || !user) return json({ error: 'not signed in' }, 401);

    const admin = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    // The customer id comes from our own table keyed by the verified user —
    // never from the request — so nobody can open someone else's portal.
    const { data: profile } = await admin
      .from('profiles')
      .select('stripe_customer_id')
      .eq('id', user.id)
      .maybeSingle();

    if (!profile?.stripe_customer_id) {
      return json({ error: 'no billing account' }, 404);
    }

    const session = await stripe.billingPortal.sessions.create({
      customer: profile.stripe_customer_id,
      return_url: `${SITE_URL}/profile.html`,
    });

    return json({ url: session.url });
  } catch (e) {
    console.error('create-portal-session failed:', e);
    return json({ error: 'could not open billing portal' }, 500);
  }
});
