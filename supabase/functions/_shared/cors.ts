// Shared CORS headers for the browser-called functions.
//
// The site is static HTML served from a different origin than the Supabase
// functions host, so every browser-facing function needs these. The webhook
// deliberately does not use them: Stripe is not a browser and never sends a
// preflight.
//
// SITE_URL defines the single allowed caller. Set it per environment rather
// than echoing back whatever Origin arrives, so a hostile page cannot call
// these functions with a signed-in user's credentials.
//
// Access-Control-Allow-Origin must be a bare origin — scheme, host, and port,
// with no path. SITE_URL can't be used directly because it legitimately
// carries a path on GitHub Pages project sites, which serve from
// https://user.github.io/RepoName. Sending that whole string as the header
// makes the browser reject every response as an origin mismatch, so derive
// the origin from it instead of asking for the same value twice.
const SITE_URL = Deno.env.get('SITE_URL') ?? '';

let allowedOrigin = '*';
try {
  if (SITE_URL) allowedOrigin = new URL(SITE_URL).origin;
} catch {
  // Malformed SITE_URL: fall back to '*' so preflights still succeed and the
  // misconfiguration shows up as a log line rather than a silent CORS wall.
  console.error(`SITE_URL is not a valid URL: ${SITE_URL}`);
}

export const corsHeaders = {
  'Access-Control-Allow-Origin': allowedOrigin,
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Vary': 'Origin',
};

/** Standard JSON reply with CORS applied. */
export function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}
