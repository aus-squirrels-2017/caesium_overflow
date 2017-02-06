$(document).ready(function() {
  // comments on comments:
  $(".comment-comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $(this).next().show();
    var id = $(this).attr("id");
  })

  $(".comments").on("submit", ".hidden-form", function(e){
    e.preventDefault();
    var here = this;
    var formData = $(this).serialize();
    var commentId = $(this).attr("id");
    this.reset();
    $.ajax({
      url: this.action,
      type: this.method,
      data: formData
    })
    .done(function(response){
      $("ol." + commentId).append(response);
    })
    $(".hidden-form").hide();
    $(".comment-comment").show();
  })
});
