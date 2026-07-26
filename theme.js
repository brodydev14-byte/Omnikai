// Omnikai Theme System — Background color only
// Accent colors (blue glows, borders) stay the same

(function() {
  const THEMES = {
    default:  '#080b10',
    purple:   '#0d0810',
    green:    '#080f0b',
    red:      '#0f0808',
    midnight: '#000000',
    navy:     '#080a14',
  };

  const saved = localStorage.getItem('omniTheme') || 'default';
  const bg = THEMES[saved] || THEMES.default;

  const style = document.createElement('style');
  style.id = 'omniThemeOverride';
  style.textContent = `
    :root { --bg: ${bg} !important; }
    html, body { background: ${bg} !important; }
    .bg-layer { background: radial-gradient(ellipse 60% 40% at 50% 10%, rgba(0,200,255,0.04) 0%, transparent 70%), ${bg} !important; }
  `;
  document.head.appendChild(style);
})();
