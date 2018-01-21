// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap/dist/js/bootstrap.min
//= require admin-lte/dist/js/adminlte.min
//= require admin-lte/plugins/iCheck/icheck

// admin-lte height bug fix
// https://stackoverflow.com/questions/46552934/how-to-fix-body-height-for-adminlte-2-4-0-and-turbolinks-5
var ready = function () {
  return $(window).trigger('resize');
};
document.addEventListener('turbolinks:load', ready);
