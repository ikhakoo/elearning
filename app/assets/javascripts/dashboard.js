$('#menu-button').on('click', function(){
	$('.demo.sidebar').sidebar('toggle');
})

$(document).on('ready page:load', function(){
  $('#search-form').submit(function(eventObject) {
    eventObject.preventDefault();
    var searchParam = $('#search').val();
    if ($('#instructors').prop("checked")){
      $.getScript('/students?search= ' + searchParam + '&instructors=true');
    } else {
      $.getScript('/students?search=' + searchParam);
    }

  });

  $('#button_to_clear').click(function(eventObject) {
    eventObject.preventDefault();
    $('#search').val("");
    if ($('#instructors').prop("checked")){
      $.getScript('/students?instructors=true');
    } else{
        $.getScript('/students');
    }

  });


  $('#instructors').change(function(eventObject) {
    eventObject.preventDefault();

    if ( $(this).prop("checked") ){
      $.ajax({
        url: '/students?instructors=true',
        type: 'GET',
        dataType: 'script'
      })
    } else {
        $.getScript('/students');
    }


  });

  // $('#students').change(function(eventObject) {
  //   eventObject.preventDefault();

  //   if ( $(this).prop("checked") ){
  //     $.getScript('/students?students=true');
  //   } else {
  //       $.getScript('/students');
  //   }

  // });

});