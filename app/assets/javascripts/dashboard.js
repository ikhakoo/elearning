$('#menu-button').on('click', function(){
	$('.demo.sidebar').sidebar('toggle');
})

$(document).on('ready page:load', function(){
  $('#search-form').submit(function(eventObject) {
    eventObject.preventDefault();
    var searchParam = $('#search').val();

    $.getScript('/students?search=' + searchParam);

  });

});