-- Reduce the Data API roles to the privileges the app actually uses.
--
-- Both public tables were handed the full set -- SELECT, INSERT, UPDATE,
-- DELETE, TRUNCATE, REFERENCES, TRIGGER -- to both `anon` and `authenticated`,
-- by this project's default privileges rather than by anything we wrote. The
-- explicit grant in 20261015000000 was therefore redundant; it was already
-- wider than intended.
--
-- Row-level security has been covering for that: with policies only for SELECT,
-- an insert or update is refused for want of a policy. But that leaves two
-- problems worth closing rather than relying on:
--
--   1. TRUNCATE is not subject to row-level security at all. A role holding it
--      can empty the table whatever the policies say. `anon` held it on
--      `profiles`, so the privilege to erase every user profile was granted to
--      the unauthenticated role. The Data API does not expose TRUNCATE, so this
--      was not reachable in practice -- but it should never have been granted,
--      and the gap between "not currently reachable" and "safe" is thinner than
--      anyone wants to depend on.
--
--   2. It leaves RLS as the only thing standing between a signed-out visitor
--      and the data. Privileges and policies are meant to be two layers; here
--      the first was wide open and only the second was doing work.
--
-- So: revoke everything from both roles, then grant back exactly what the
-- client does. `anon` gets nothing -- omni-auth.js never touches either table
-- without a session, and the signup path writes `profiles` through the
-- handle_new_user trigger, which runs as definer and does not need a grant.

revoke all on public.profiles        from anon, authenticated;
revoke all on public.premium_content from anon, authenticated;

-- profiles: what omni-auth.js genuinely does -- pullProfile selects,
-- createProfile inserts its own row, pushProfile updates name and state.
-- Deliberately no DELETE: account deletion goes through auth.users and
-- cascades, so a client never needs to remove a row. Row-level security still
-- restricts every one of these to the caller's own row, and the guard_plan
-- trigger still rejects client writes to the billing columns.
grant select, insert, update on public.profiles to authenticated;

-- premium_content: read-only, and the policy narrows that to Warriors.
-- Content is authored by the service role through migrations.
grant select on public.premium_content to authenticated;
