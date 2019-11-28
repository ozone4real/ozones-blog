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
//= require rails-ujs
//= require jquery3
//= require jquery-ui/widgets/autocomplete
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .
//= require quill.min
//= require quill.global
//= require toastr
//= require bootstrap-multiselect

$(document).ready(function() {
  toastr.options = {
    closeButton: true,
    debug: false,
    positionClass: 'toast-top-right',
    preventDuplicates: true,
    progressBar: true,
    onclick: null,
    showDuration: '300',
    hideDuration: '1000',
    timeOut: '5000',
    extendedTimeOut: '1000',
    showEasing: 'swing',
    hideEasing: 'linear',
    showMethod: 'show',
    hideMethod: 'hide'
  };
});

// toastr.options = {
//   "closeButton": true,
//   "debug": false,
//   "newestOnTop": false,
//   "progressBar": true,
//   "positionClass": "toast-top-right",
//   "preventDuplicates": true,
//   "onclick": null,
//   "showDuration": "300",
//   "hideDuration": "1000",
//   "timeOut": "5000",
//   "extendedTimeOut": "1000",
//   "showEasing": "swing",
//   "hideEasing": "linear",
//   "showMethod": "show",
//   "hideMethod": "hide"
// }