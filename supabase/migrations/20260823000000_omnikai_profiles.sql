-- Omnikai profiles: accounts, row-level security, and signup wiring.
--
-- Applied with `supabase db push`, which talks straight to Postgres. The
-- dashboard SQL editor's parsing quirks don't apply here, so this uses
-- ordinary $$ quoting rather than the escaped-single-quote workaround.

-- Remove the placeholder table built by hand in the Table Editor while the
-- SQL editor was failing. It had the form's default columns (a numeric id
-- and created_at) rather than the ones the app needs, and `create table if
-- not exists` below would otherwise silently keep it and attach the
-- policies to the wrong shape. Verified empty (0 rows) before writing this.
drop table if exists public.profiles cascade;

-- ===========================================================
-- PROFILES
-- One row per user, keyed to Supabase's auth.users table.
-- Columns that matter for access control (plan) are real columns.
-- The rest of the app's grab-bag of omni* keys lives in `state`.
-- ===========================================================
create table if not exists public.profiles (
  id          uuid        primary key references auth.users(id) on delete cascade,
  name        text        not null default 'Warrior',
  -- 'wanderer' = free tier, 'warrior' = paid. Names match what the app's
  -- pages already check for (plans.html, profile.html, dashboard.html).
  plan        text        not null default 'wanderer' check (plan in ('wanderer','warrior')),
  state       jsonb       not null default '{}'::jsonb,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

alter table public.profiles enable row level security;

-- ===========================================================
-- ROW LEVEL SECURITY
-- Enforced by Postgres, not by the browser. A user can only ever
-- see and touch their own row, whatever the client-side code says.
-- ===========================================================
drop policy if exists "read own profile"   on public.profiles;
drop policy if exists "insert own profile" on public.profiles;
drop policy if exists "update own profile" on public.profiles;

create policy "read own profile"   on public.profiles for select using (auth.uid() = id);
create policy "insert own profile" on public.profiles for insert with check (auth.uid() = id);
create policy "update own profile" on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);

-- Note: there is deliberately no delete policy. Account deletion goes
-- through auth.users and cascades here, so a client cannot orphan a row.

-- ===========================================================
-- TIER ENFORCEMENT
-- RLS lets a user update their own row, which would let them set
-- plan='warrior' from the browser console. This trigger rejects any
-- client-originated change to `plan`. Only the service role (a payment
-- webhook, or you in the dashboard) can move someone between tiers.
-- ===========================================================
create or replace function public.guard_plan_column()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.plan is distinct from old.plan
     and coalesce(current_setting('request.jwt.claims', true)::jsonb ->> 'role', '') <> 'service_role'
  then
    raise exception 'plan cannot be changed from the client';
  end if;
  new.updated_at := now();
  return new;
end;
$$;

drop trigger if exists guard_plan on public.profiles;
create trigger guard_plan
  before update on public.profiles
  for each row execute function public.guard_plan_column();

-- ===========================================================
-- AUTO-CREATE PROFILE ON SIGNUP
-- Fires when Supabase inserts into auth.users, so a profile row always
-- exists by the time the user reaches the app. Runs as definer to
-- bypass RLS during the insert.
-- ===========================================================
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, name)
  values (
    new.id,
    coalesce(
      nullif(new.raw_user_meta_data ->> 'name', ''),
      nullif(new.raw_user_meta_data ->> 'full_name', ''),
      'Warrior'
    )
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
