(function() {
  const themes = {
    default: '#080b10',
    purple:  '#0a0810',
    green:   '#080f0a',
    red:     '#0f0808',
    navy:    '#07080f',
  };
  const bg = themes[localStorage.getItem('omniTheme')] || '#080b10';
  const style = document.createElement('style');
  style.textContent = `
    html, body, .bg-layer { background: ${bg} !important; background-color: ${bg} !important; }
    :root { --bg: ${bg} !important; }
  `;
  document.head.appendChild(style);
})();
