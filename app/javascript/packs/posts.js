  $(document).on('turbolinks:load', function() {
  $("#post_thumbnail").change(function() {
    readURL(this);
  });

  $(".load-more").on('click', function(e) {
    e.preventDefault();
    console.log(e.target.href);
    $.ajax({
      url: e.target.href,
      method: 'GET',
      contentType: 'application/json',
      dataType: "json",
      success: function(res) {
        if(res) {
          $('.post-list').append(res.html);
          $('.load-more').attr('href', res.next_page_url);

          if(!res.next_page) {
            $('.load-more').attr('href', '');
            $('.load-more').removeClass('btn-primary').addClass('disabled btn-secondary')
          }
        }

      },
      error: function(err) {
        console.log(err);
      }
    })
  })
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
