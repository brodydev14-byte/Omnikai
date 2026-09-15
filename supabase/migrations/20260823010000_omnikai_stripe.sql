-- Omnikai billing: Stripe subscription state on the profile.
--
-- The app already had everything it needed to gate content: `plan` is a real
-- column, the client is forbidden from writing it, and omni-auth.js treats the
-- server as the only authority on tier. This migration adds the Stripe
-- bookkeeping that decides when `plan` should move.

-- ===========================================================
-- BILLING COLUMNS
-- Nullable throughout: a wanderer who has never opened checkout has no
-- Stripe presence at all, and that is the normal state for most rows.
-- ===========================================================
alter table public.profiles
  add column if not exists stripe_customer_id     text,
  add column if not exists stripe_subscription_id text,
  add column if not exists subscription_status    text,
  add column if not exists current_period_end     timestamptz;

-- One Stripe customer maps to exactly one profile. Partial, because the
-- column is null for every free user and nulls would otherwise collide.
create unique index if not exists profiles_stripe_customer_id_key
  on public.profiles (stripe_customer_id)
  where stripe_customer_id is not null;

-- The webhook looks rows up by subscription id on cancellation events.
create index if not exists profiles_stripe_subscription_id_idx
  on public.profiles (stripe_subscription_id)
  where stripe_subscription_id is not null;

-- ===========================================================
-- TIER ENFORCEMENT (extended)
-- The original trigger guarded `plan` alone. That is no longer enough:
-- the webhook resolves a user by stripe_customer_id, so a client that can
-- write that column can point it at someone else's Stripe customer and
-- collect their subscription. The unique index stops the blatant version
-- of that, but a user could still pre-claim a customer id that does not
-- exist yet and make the real owner's webhook update fail.
--
-- So every billing column is now server-only, on the same rule as `plan`:
-- the service role (the Stripe webhook, or you in the dashboard) may write
-- them, and nobody else. Clients keep read access to their own row, which
-- is what lets profile.html show subscription status.
-- ===========================================================
create or replace function public.guard_plan_column()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  is_service_role boolean := coalesce(
    current_setting('request.jwt.claims', true)::jsonb ->> 'role', ''
  ) = 'service_role';
begin
  if not is_service_role and (
       new.plan                   is distinct from old.plan
    or new.stripe_customer_id     is distinct from old.stripe_customer_id
    or new.stripe_subscription_id is distinct from old.stripe_subscription_id
    or new.subscription_status    is distinct from old.subscription_status
    or new.current_period_end     is distinct from old.current_period_end
  ) then
    raise exception 'billing fields cannot be changed from the client';
  end if;

  new.updated_at := now();
  return new;
end;
$$;

-- Trigger definition is unchanged; recreated so a partial apply still lands.
drop trigger if exists guard_plan on public.profiles;
create trigger guard_plan
  before update on public.profiles
  for each row execute function public.guard_plan_column();
