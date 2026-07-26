// Omnikai Theme System
// Add <script src="theme.js"></script> to every page
// Reads theme from localStorage and applies before render

(function() {
  const THEMES = {
    blue:   { blue: '#00c8ff', glow: '0,200,255' },
    purple: { blue: '#8b5cf6', glow: '139,92,246' },
    green:  { blue: '#10b981', glow: '16,185,129' },
    red:    { blue: '#ef4444', glow: '239,68,68' },
    midnight: { blue: '#ffffff', glow: '255,255,255' },
    gold:   { blue: '#ffd700', glow: '255,215,0' },
  };

  const saved = localStorage.getItem('omniTheme') || 'blue';
  const theme = THEMES[saved] || THEMES.blue;

  // Inject CSS variables before page renders — no flash
  const style = document.createElement('style');
  style.id = 'omniThemeOverride';
  style.textContent = `
    :root {
      --blue: ${theme.blue} !important;
      --blue-glow: rgba(${theme.glow}, 0.18) !important;
    }
    .xp-fill { background: linear-gradient(90deg, ${theme.blue}, ${theme.blue}99) !important; box-shadow: 0 0 8px rgba(${theme.glow}, 0.4) !important; }
    .nav-item.active .nav-label { color: ${theme.blue} !important; }
    .day-dot.done { background: ${theme.blue} !important; box-shadow: 0 0 6px rgba(${theme.glow}, 0.5) !important; }
  `;
  document.head.appendChild(style);
})();
