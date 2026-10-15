-- Premium workout content, held server-side instead of in public HTML files.
--
-- The problem this fixes: every intermediate and advanced session lived in its
-- own .html file served by GitHub Pages. The paywall was one line of JavaScript
-- that blanked the page, so anyone could read the whole workout from view-source
-- without paying -- the gate was cosmetic because the content had already been
-- handed to the browser.
--
-- Now the content lives here and Postgres decides who may read it. A Wanderer's
-- request returns no rows, so the drills never reach their browser at all. This
-- is the same kind of enforcement already protecting `plan` itself: the database
-- is the authority, not the client.

create table if not exists public.premium_content (
  -- Matches the page filename without .html, e.g. 'bjj_advanced_a'.
  slug        text        primary key,
  -- The inner HTML of the page's .scroll-wrap container.
  html        text        not null,
  updated_at  timestamptz not null default now()
);

alter table public.premium_content enable row level security;

-- ===========================================================
-- ENTITLEMENT CHECK
-- Security definer so the policy can read profiles without being
-- subject to profiles' own row-level security, and so the rule lives
-- in exactly one place rather than being restated per policy.
-- ===========================================================
create or replace function public.is_warrior()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1
    from public.profiles
    where id = auth.uid()
      and plan = 'warrior'
  );
$$;

-- ===========================================================
-- ACCESS
-- Read-only, and only for paid users. There is deliberately no insert,
-- update or delete policy: content is authored by the service role
-- (migrations, or you in the dashboard), never by a client.
-- ===========================================================
drop policy if exists "warriors read premium content" on public.premium_content;

create policy "warriors read premium content"
  on public.premium_content
  for select
  using (public.is_warrior());

-- RLS alone is not enough. This project does not auto-expose new tables to the
-- Data API roles, so without an explicit grant even a Warrior's select fails on
-- table privileges before any policy is consulted. `anon` is granted nothing --
-- a signed-out visitor has no business here, and saying so in privileges as
-- well as in policy keeps the two layers agreeing.
grant select on public.premium_content to authenticated;
