/* ════════════════════════════════════════════════════════════════
   Omnikai — Stripe webhook.

   The only thing in the system that moves a user between tiers.
   Everything else (checkout, the portal, the pricing page) just
   arranges for one of these events to arrive.

   Requires verify_jwt = false in config.toml: Stripe authenticates
   with a signature header, not a Supabase JWT.
   ════════════════════════════════════════════════════════════════ */
import Stripe from 'https://esm.sh/stripe@18?target=deno';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, {
  httpClient: Stripe.createFetchHttpClient(),
});

// Deno has no synchronous crypto, so signature verification must use the
// async path with an explicit SubtleCrypto provider.
const cryptoProvider = Stripe.createSubtleCryptoProvider();

const WEBHOOK_SECRET = Deno.env.get('STRIPE_WEBHOOK_SECRET')!;

const admin = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
);

/** Statuses that should unlock premium content.
    past_due is deliberately excluded — Stripe retries failed payments for
    days, and we'd rather drop someone to the free tier and let a successful
    retry restore them than serve paid content indefinitely on a dead card. */
const ENTITLED = new Set(['active', 'trialing']);

/** Stripe moved current_period_end onto subscription items in 2025; older
    API versions keep it on the subscription. Read whichever is present. */
function periodEnd(sub: Stripe.Subscription): string | null {
  const raw = sub.items?.data?.[0]?.current_period_end
    ?? (sub as unknown as { current_period_end?: number }).current_period_end;
  return raw ? new Date(raw * 1000).toISOString() : null;
}

/** Resolve the profile this subscription belongs to.
    Metadata is the fast path; the customer id is the fallback for
    subscriptions created outside our checkout flow (e.g. by hand in the
    dashboard, which is how you'd comp someone a free month). */
async function resolveUserId(sub: Stripe.Subscription): Promise<string | null> {
  const fromMetadata = sub.metadata?.supabase_uid;
  if (fromMetadata) return fromMetadata;

  const customerId = typeof sub.customer === 'string' ? sub.customer : sub.customer?.id;
  if (!customerId) return null;

  const { data } = await admin
    .from('profiles')
    .select('id')
    .eq('stripe_customer_id', customerId)
    .maybeSingle();

  return data?.id ?? null;
}

/** Write the subscription's current truth onto the profile. */
async function syncSubscription(sub: Stripe.Subscription): Promise<void> {
  const userId = await resolveUserId(sub);
  if (!userId) {
    // Most likely a subscription belonging to another app in this same
    // Stripe account. Not an error — just not ours.
    console.warn(`no Omnikai profile for subscription ${sub.id}; ignoring`);
    return;
  }

  const entitled = ENTITLED.has(sub.status);
  const customerId = typeof sub.customer === 'string' ? sub.customer : sub.customer?.id;

  const { error } = await admin
    .from('profiles')
    .update({
      plan: entitled ? 'warrior' : 'wanderer',
      stripe_customer_id: customerId ?? undefined,
      stripe_subscription_id: sub.id,
      subscription_status: sub.status,
      current_period_end: periodEnd(sub),
    })
    .eq('id', userId);

  if (error) {
    // Throwing gives Stripe a non-2xx, so it retries with backoff rather
    // than leaving a paying customer stuck on the free tier.
    throw new Error(`profile update failed for ${userId}: ${error.message}`);
  }

  console.info(`${userId} -> ${entitled ? 'warrior' : 'wanderer'} (${sub.status})`);
}

Deno.serve(async (req) => {
  const signature = req.headers.get('Stripe-Signature');
  if (!signature) return new Response('missing signature', { status: 400 });

  // Must be the raw body text — parsing it first would break the signature.
  const body = await req.text();

  let event: Stripe.Event;
  try {
    event = await stripe.webhooks.constructEventAsync(
      body, signature, WEBHOOK_SECRET, undefined, cryptoProvider,
    );
  } catch (e) {
    console.error('signature verification failed:', e);
    return new Response('invalid signature', { status: 400 });
  }

  try {
    switch (event.type) {
      // Checkout finished. The session carries only a subscription id, so
      // fetch the real thing rather than trusting a partial object.
      case 'checkout.session.completed': {
        const session = event.data.object as Stripe.Checkout.Session;
        if (session.mode !== 'subscription' || !session.subscription) break;

        const subId = typeof session.subscription === 'string'
          ? session.subscription
          : session.subscription.id;
        const sub = await stripe.subscriptions.retrieve(subId);

        // Checkout knows the user even when subscription metadata doesn't.
        if (!sub.metadata?.supabase_uid && session.client_reference_id) {
          sub.metadata = { ...sub.metadata, supabase_uid: session.client_reference_id };
          // Persist it so later events on this subscription resolve directly.
          await stripe.subscriptions.update(subId, {
            metadata: { supabase_uid: session.client_reference_id },
          });
        }

        await syncSubscription(sub);
        break;
      }

      // Renewals, cancellations, payment failures, plan changes — every
      // later state change lands here and is handled identically.
      case 'customer.subscription.created':
      case 'customer.subscription.updated':
      case 'customer.subscription.deleted':
        await syncSubscription(event.data.object as Stripe.Subscription);
        break;

      default:
        // Subscribed to more events than we handle is fine and expected.
        break;
    }
  } catch (e) {
    console.error(`handling ${event.type} failed:`, e);
    return new Response('handler error', { status: 500 });
  }

  return new Response(JSON.stringify({ received: true }), {
    status: 200,
    headers: { 'Content-Type': 'application/json' },
  });
});
