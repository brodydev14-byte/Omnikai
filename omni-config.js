// Omnikai — Supabase connection settings.
//
// Both values come from the Supabase dashboard:
//   Project Settings → API → "Project URL" and the publishable key
//   (older projects call this the "anon / public" key — same thing).
//
// The publishable key is designed to be public and is safe to commit — it
// grants no access on its own. Every table is protected by Row Level
// Security (see supabase-schema.sql), so the database decides who reads what.
//
// Never put the secret key here (shown as "service_role" or "sb_secret_…").
// That one bypasses RLS and belongs only on a server you control.

window.OMNI_CONFIG = {
  SUPABASE_URL: 'https://ewnelykmwzqdusjlhdwu.supabase.co',
  SUPABASE_ANON_KEY: 'sb_publishable_iZrv3QDwB8iij-t3SlrC8A_jBoyLENf',
};
