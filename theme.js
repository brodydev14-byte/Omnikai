// Omnikai Theme System — Background tint only
// Electric blue accents stay the same on every theme

(function() {
  const THEMES = {
    default:  { bg: '#080b10', grad: 'rgba(0,200,255,0.04)' },
    purple:   { bg: '#0a0810', grad: 'rgba(139,92,246,0.04)' },
    green:    { bg: '#080f0a', grad: 'rgba(16,185,129,0.04)' },
    red:      { bg: '#0f0808', grad: 'rgba(239,68,68,0.04)' },
    navy:     { bg: '#07080f', grad: 'rgba(0,100,255,0.05)' },
  };

  const saved = localStorage.getItem('omniTheme') || 'default';
  const t = THEMES[saved] || THEMES.default;

  const style = document.createElement('style');
  style.textContent = `
    :root { --bg: ${t.bg} !important; }
    html, body { background: ${t.bg} !important; }
    .bg-layer { background: radial-gradient(ellipse 60% 40% at 50% 10%, ${t.grad} 0%, transparent 70%), ${t.bg} !important; }
  `;
  document.head.appendChild(style);
})();
