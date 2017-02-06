$(document).ready(function() {
  // comments on comments:
  $(".comment-comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $(this).next().show();
  });
  $(".comments").on("submit", ".hidden-form", function(e){
    e.preventDefault();
    var here = this
    var formData = $(this).serialize();
    // var method   = $(this).attr('method');
    // var action   = $(this).attr('action');
    var answer   = $(this).parent().children(":first");
    // console.log(this.action)
    $.ajax({
      url: this.action,
      type: this.method,
      data: formData
    })
    .done(function(response){
      // $(here).parent().children(':last').append(response);
      console.log(response);
      console.log($(here).parent().children());
      // $(here).parent().children(':last').append(response);
    })
    // still working on this.
  })
});
