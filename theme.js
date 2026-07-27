(function() {
  const themes = {
    default: '#080b10',
    purple:  '#0a0810',
    green:   '#080f0a',
    red:     '#0f0808',
    navy:    '#07080f',
    black:   '#000000',
  };
  const saved = localStorage.getItem('omniTheme') || 'default';
  const bg = themes[saved] || '#080b10';
  
  // Apply immediately to document
  document.documentElement.style.backgroundColor = bg;
  document.documentElement.style.setProperty('--bg', bg);
  
  // Also apply after DOM loads to catch .bg-layer
  document.addEventListener('DOMContentLoaded', function() {
    document.body.style.backgroundColor = bg;
    const bgLayer = document.querySelector('.bg-layer');
    if (bgLayer) {
      bgLayer.style.backgroundColor = bg;
      bgLayer.style.background = bg;
    }
  });
})();
