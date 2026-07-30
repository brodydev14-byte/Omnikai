(function() {
  var themes = {
    default: ['rgba(0,200,255,0.14)','rgba(0,100,180,0.07)'],
    red:     ['rgba(239,68,68,0.14)','rgba(180,30,30,0.07)'],
    green:   ['rgba(16,185,129,0.14)','rgba(10,120,80,0.07)'],
    purple:  ['rgba(139,92,246,0.14)','rgba(80,40,180,0.07)'],
    gold:    ['rgba(255,215,0,0.12)','rgba(180,140,0,0.06)'],
  };
  var saved = localStorage.getItem('omniTheme') || 'default';
  var c = themes[saved] || themes.default;
  var style = document.createElement('style');
  style.textContent = '.bg-layer { background: radial-gradient(ellipse 80% 60% at 50% 10%, ' + c[0] + ' 0%, ' + c[1] + ' 40%, transparent 70%), #080b10 !important; }';
  document.head.appendChild(style);
})();
