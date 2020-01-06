$( document ).on('turbolinks:load', function() {
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '500px'
  });
});

var ready = function () {
  var o;
  o = $.AdminLTE.options;
  if (o.sidebarPushMenu) {
    $.AdminLTE.pushMenu.activate(o.sidebarToggleSelector);
  }
  return $.AdminLTE.layout.activate();
};
document.addEventListener('turbolinks:load', ready);
var ready = function () {
    return $(window).trigger('resize');
};
document.addEventListener('turbolinks:load', ready);
