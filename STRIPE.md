# Omnikai — Stripe billing

How a payment turns into `plan = 'warrior'`, and what you have to configure
to make that happen.

Everything below is wired to a **sandbox** Stripe account
(`acct_1TzoJz9h5Wf8VlLd`, "Brody Harris sandbox"). Nothing here touches live
money. See [Going live](#going-live) at the bottom.

> That sandbox is shared with the Padwright products. Omnikai's objects all
> carry `metadata.app = "omnikai"` so they're easy to tell apart.

---

## How it works

```
plans.html                  create-checkout-session          Stripe
  "Begin as a Warrior"  ──▶   verifies the user's JWT   ──▶   Checkout
                              finds/creates a customer         │
                                                               │ user pays
                              stripe-webhook                   ▼
profiles.plan = 'warrior' ◀──  verifies the signature  ◀──  webhook event
```

The important property: **checkout never grants access**. It only opens a
Stripe session. The webhook is the single thing that writes `plan`, because
it's the only participant that sees how the payment actually ended — a user
can close the tab mid-flow, a card can fail three days later, someone can
cancel from the portal.

The database enforces this rather than trusting the front-end. The `guard_plan`
trigger rejects any client-originated write to `plan` or the `stripe_*`
columns; only the service role (these functions) can move someone's tier. So
the 169 pages that read `sessionStorage.omniPlan` are safe to keep trusting it
— omni-auth.js only ever populates it from the server.

## What was created in Stripe

| Object | ID |
| --- | --- |
| Product — Omnikai Warrior | `prod_V7yrlfOyL5N1K4` |
| Price — $9.99 USD / month | `price_1U7iu89h5Wf8VlLdq7KRyW8s` |
| Webhook endpoint | `we_1U7iyF9h5Wf8VlLdhDL1zjUM` |

The price matches the $9.99/month already advertised on `plans.html`.

The webhook points at
`https://ewnelykmwzqdusjlhdwu.supabase.co/functions/v1/stripe-webhook` and is
subscribed to `checkout.session.completed` plus the three
`customer.subscription.*` events.

## What you still have to do

### 1. Install the Supabase CLI

This machine has no Node, so the usual `npm i -g supabase` won't work. Use the
standalone binary:

```bash
scoop install supabase
```

(Or download a release from `github.com/supabase/cli/releases` and put it on
your PATH.)

### 2. Activate the customer portal

The portal has no configuration in this sandbox yet, so
`create-portal-session` will error until you turn it on. It can't be created
over the API — do it once in the dashboard:

**Settings → Billing → Customer portal → Activate**, with "Cancel
subscriptions" enabled. That's what makes the "Cancel anytime" promise on
`plans.html` true.

### 3. Set the function secrets

`SUPABASE_URL`, `SUPABASE_ANON_KEY`, and `SUPABASE_SERVICE_ROLE_KEY` are
injected automatically — don't set those.

```bash
supabase secrets set STRIPE_SECRET_KEY=sk_test_your_sandbox_key
```

```bash
supabase secrets set STRIPE_WEBHOOK_SECRET=whsec_the_endpoint_signing_secret
```

```bash
supabase secrets set STRIPE_PRICE_WARRIOR=price_1U7iu89h5Wf8VlLdq7KRyW8s
```

```bash
supabase secrets set SITE_URL=https://your-omnikai-domain
```

`SITE_URL` has no trailing slash and is the origin the site is actually served
from. It does double duty: it's the allowed CORS origin, and it's the base of
the Stripe return URLs. Both are security boundaries, which is why it's server
config and not something the browser sends.

The sandbox secret key is under **Developers → API keys** (`sk_test_…`). The
webhook signing secret was generated when the endpoint was created and is only
shown once — if it's lost, roll it on the endpoint under
**Developers → Webhooks**.

### 4. Push the schema and deploy

```bash
supabase db push
```

```bash
supabase functions deploy create-checkout-session stripe-webhook create-portal-session
```

### 5. Test it

Use Stripe's test card `4242 4242 4242 4242`, any future expiry, any CVC.

Sign in, go to `plans.html`, click **Begin as a Warrior**, and pay. Then check:

- `profiles.plan` for your user reads `warrior`
- the webhook endpoint's delivery log shows a 200
- reloading the app unlocks the gated workouts

If the plan didn't move, the webhook is where to look:

```bash
supabase functions logs stripe-webhook
```

## Design notes

**Why `past_due` doesn't keep access.** Stripe retries a failed payment for
days. Treating `past_due` as entitled would serve paid content indefinitely on
a dead card, so only `active` and `trialing` unlock. A successful retry fires
`customer.subscription.updated` and restores them automatically.

**Why the return page is allowlisted.** `plans.html` sits in the onboarding
chain, so a user can subscribe before finishing setup. Sending everyone to
`dashboard.html` would bounce those users straight back to `plans.html`
(omni-auth.js redirects anyone without `omniSetupComplete`) — an infinite loop
for someone who has just paid. So the caller picks the landing page, but only
from a fixed list, since an unvalidated return path is an open redirect.

**Why the webhook throws on a failed database write.** A non-2xx makes Stripe
retry with backoff. Swallowing the error would leave a paying customer stuck on
the free tier with no second chance.

**Subscriptions that aren't ours.** The webhook ignores any subscription it
can't map to an Omnikai profile — that's the Padwright products sharing this
account, not a failure.

## Going live

When you're ready, in the **live** Stripe account:

1. Recreate the product, price, and webhook endpoint (live mode has its own
   objects — none of the IDs above exist there).
2. Activate the customer portal again; it's also per-mode.
3. Re-set `STRIPE_SECRET_KEY` (`sk_live_…`), `STRIPE_WEBHOOK_SECRET`, and
   `STRIPE_PRICE_WARRIOR` to the live values, and point `SITE_URL` at the
   production domain.

No application code changes — the environment lives entirely in the secrets.
