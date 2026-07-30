(function() {
  var themes = {
    default: ['rgba(0,200,255,0.28)','rgba(0,100,180,0.14)'],
    red:     ['rgba(239,68,68,0.28)','rgba(180,30,30,0.14)'],
    green:   ['rgba(16,185,129,0.28)','rgba(10,120,80,0.14)'],
    purple:  ['rgba(139,92,246,0.28)','rgba(80,40,180,0.14)'],
    gold:    ['rgba(255,215,0,0.24)','rgba(180,140,0,0.12)'],
  };
  var saved = localStorage.getItem('omniTheme') || 'default';
  var c = themes[saved] || themes.default;
  var css = '.bg-layer { background: radial-gradient(ellipse 80% 60% at 50% 10%, ' + c[0] + ' 0%, ' + c[1] + ' 40%, transparent 70%), #080b10 !important; }';
  
  // Inject immediately
  var style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);
  
  // Also inject after DOM loads to override any late CSS
  document.addEventListener('DOMContentLoaded', function() {
    var style2 = document.createElement('style');
    style2.textContent = css;
    document.head.appendChild(style2);
    var el = document.querySelector('.bg-layer');
    if (el) el.style.cssText = 'position:fixed;inset:0;z-index:0;background:radial-gradient(ellipse 80% 60% at 50% 10%, ' + c[0] + ' 0%, ' + c[1] + ' 40%, transparent 70%), #080b10;';
  });
})();
