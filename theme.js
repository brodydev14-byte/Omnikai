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
  // Only change the background - nothing else
  const style = document.createElement('style');
  style.textContent = `html { background-color: ${bg} !important; } body { background-color: ${bg} !important; } .bg-layer { background-color: ${bg} !important; }`;
  document.head.appendChild(style);
})();
