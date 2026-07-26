(function() {
  const themes = {
    default: '#080b10',
    purple:  '#0a0810',
    green:   '#080f0a',
    red:     '#0f0808',
    navy:    '#07080f',
  };
  const bg = themes[localStorage.getItem('omniTheme')] || '#080b10';
  document.documentElement.style.setProperty('--bg', bg);
  document.documentElement.style.background = bg;
})();
