(function() {
  var themes = {
    default: ['rgba(0,200,255,0.22)','rgba(0,100,180,0.12)'],
    red:     ['rgba(239,68,68,0.22)','rgba(180,30,30,0.12)'],
    green:   ['rgba(16,185,129,0.22)','rgba(10,120,80,0.12)'],
    purple:  ['rgba(139,92,246,0.22)','rgba(80,40,180,0.12)'],
    gold:    ['rgba(255,215,0,0.20)','rgba(180,140,0,0.10)'],
  };
  var saved = localStorage.getItem('omniTheme') || 'default';
  var c = themes[saved] || themes.default;
  var bg = 'radial-gradient(ellipse 120% 80% at 50% 0%, ' + c[0] + ' 0%, ' + c[1] + ' 50%, transparent 80%), #080b10';
  var css = '.bg-layer { background: ' + bg + ' !important; }';
  var style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);
  document.addEventListener('DOMContentLoaded', function() {
    var el = document.querySelector('.bg-layer');
    if (el) el.style.cssText = 'position:fixed;inset:0;z-index:0;background:' + bg + ';';
  });
})();
