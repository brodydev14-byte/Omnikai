-- Fix: the billing guard was rejecting the Stripe webhook's own writes.
--
-- The previous version identified the service role solely by reading a JWT
-- claim off the request:
--
--   current_setting('request.jwt.claims', true)::jsonb ->> 'role'
--
-- That holds for the legacy JWT-style service key, but this project uses
-- Supabase's newer API key format (sb_secret_… / sb_publishable_…), where that
-- setting can be absent entirely. When it is, coalesce() yields '', the guard
-- concludes the caller is a browser, and it raises — so stripe-webhook could
-- not move anyone onto the paid plan. A paying customer stayed on 'wanderer'
-- and Stripe saw a 500.
--
-- The fix is to also check the Postgres role the connection actually runs as.
-- Supabase's service key connects as the `service_role` database role, which
-- is true regardless of key format and cannot be spoofed by a browser client:
-- an anon or authenticated request arrives as a different role, and nothing
-- the client sends can change that.
--
-- Both checks are kept, so this works under either key format.
create or replace function public.guard_plan_column()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  -- The role Postgres is executing as. Authoritative and client-proof.
  by_db_role boolean := current_user = 'service_role';

  -- The legacy JWT claim. Retained so this keeps working on projects still
  -- using the old key style.
  by_jwt_claim boolean := coalesce(
    current_setting('request.jwt.claims', true)::jsonb ->> 'role', ''
  ) = 'service_role';

  is_service_role boolean := by_db_role or by_jwt_claim;
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

-- Unchanged, recreated so a partial apply still lands.
drop trigger if exists guard_plan on public.profiles;
create trigger guard_plan
  before update on public.profiles
  for each row execute function public.guard_plan_column();
