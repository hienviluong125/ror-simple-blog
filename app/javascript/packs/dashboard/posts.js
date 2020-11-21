$(document).on('turbolinks:load', function() {
  $("#post_thumbnail").change(function() {
    readURL(this);
  });
});

function readURL(input) {
  if (input.files && input.files[0]) {
    let reader = new FileReader();

    reader.onload = function(e) {
      $('.post_thumbnail_image').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}
