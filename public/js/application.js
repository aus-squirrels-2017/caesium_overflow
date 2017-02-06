$(document).ready(function() {
  // comments on comments:
  $(".comment-comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $(this).next().show();
  });
  $(".comments").on("click", ".hidden-form", function(e){
    e.preventDefault();
    console.log($(this).text());
    var method = $(this).attr('method');
    var action = $(this).attr('action');
    var answer = $(this).parent().children(":first");
    var formData = $(this).serializeArray();
    // $.ajax({
      // url: action
      // type: method
      // data:
    // })

  })
});
