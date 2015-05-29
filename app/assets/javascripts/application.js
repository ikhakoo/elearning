// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .
// Loads all Semantic javascripts

(function ($) {
  $(document).ready(function(){
  	//hide .navbar first
  	$("#navibar").hide();
  	//fade in .navbar
  	$(function () {
    	$(window).scroll(function () {
      // set distance user needs to scroll before we fadeIn navbar
      	if ($(this).scrollTop() > 600) {
        	$('.navbar').show();
      	} else {
        	$('.navbar').fadeOut();
      	}
    	});
  	});
	});
}(jQuery));