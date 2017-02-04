
$(document).ready(function() {

$('.fa').on('click', function(e) {
  e.preventDefault();
  var data = $(this).val();
  var here = this;
  var parent = $(here).parent().parent().attr("id");
  $.ajax({
    url: $(this).parent().attr('action'),
    type: 'post',
    data: data
  }).done( function(response){
    $("#" + parent + " .points").html(response);
  });
});

});
