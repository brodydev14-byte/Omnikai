/* ════════════════════════════════════════════════════════════════
   Omnikai — background theme

   Runs first on every page, before anything renders, so the chosen
   colour is already in place and the app never flashes blue before
   switching.

   Each theme is a single accent colour. The glows and the grid are all
   derived from it, so adding a theme is one line rather than five
   hand-tuned rgba strings that drift apart.

   What this fixes:
     - The grid was never themed. It stayed blue on every theme, at
       0.025 alpha, which is invisible — so switching themes changed
       almost nothing you could see.
     - The glow faded to transparent by 80% from a single top anchor,
       leaving the lower half flat #080b10. On a tall phone that reads
       as the page being broken rather than dark by design.
   ════════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  // Accent per theme, as plain RGB. Keys are the values already stored in
  // omniTheme, so existing choices keep working.
  var THEMES = {
    default: [0, 200, 255],    // electric blue
    red:     [255, 45, 70],    // electric red
    green:   [0, 255, 150],    // electric green
    purple:  [168, 95, 255],   // electric violet
    gold:    [255, 200, 0],    // electric gold
  };

  var BASE = '#080b10';

  function rgba(c, a) {
    return 'rgba(' + c[0] + ',' + c[1] + ',' + c[2] + ',' + a + ')';
  }

  // Reading localStorage throws in some sandboxed contexts (private mode,
  // blocked site data). The theme is cosmetic, so fall back rather than
  // taking the whole page down with it.
  var saved = 'default';
  try {
    saved = localStorage.getItem('omniTheme') || 'default';
  } catch (e) { /* keep the default */ }

  var c = THEMES[saved] || THEMES.default;

  /* Two glows rather than one. The top carries the colour; the fainter
     bottom one stops the lower half collapsing to flat black. */
  var bg =
    'radial-gradient(ellipse 120% 80% at 50% 0%, ' +
      rgba(c, 0.42) + ' 0%, ' + rgba(c, 0.16) + ' 45%, transparent 80%), ' +
    'radial-gradient(ellipse 110% 55% at 50% 100%, ' +
      rgba(c, 0.16) + ' 0%, transparent 75%), ' +
    BASE;

  /* The grid at 0.025 may as well not exist. At 0.11 it reads as an
     electric mesh — the thing that makes the login page look alive —
     without competing with the cards sitting on top of it. */
  var grid =
    'linear-gradient(' + rgba(c, 0.11) + ' 1px, transparent 1px), ' +
    'linear-gradient(90deg, ' + rgba(c, 0.11) + ' 1px, transparent 1px)';

  /* !important because every page carries its own .bg-layer and
     .grid-lines rules inline in a <style> block, and this has to win
     against all 162 of them without editing any. */
  var css =
    '.bg-layer { background: ' + bg + ' !important; }' +
    '.grid-lines { background-image: ' + grid + ' !important; }';

  var style = document.createElement('style');
  style.textContent = css;

  // <head> may not exist yet depending on where this script sits; fall
  // back to documentElement so the rule still lands.
  (document.head || document.documentElement).appendChild(style);
})();
