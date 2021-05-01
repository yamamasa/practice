$(document).ready( function () {
  const domain = location.href.match(/^http?(s)?(:\/\/[a-zA-Z0-9-.:]+)/i)[0];
  $('a[href^=http]').not('[href*="'+domain+'"]').attr('target','_blank');
});
