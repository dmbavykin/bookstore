$(() => {
  $('.make-review .fa-star').each(function() {
    $(this).on('click', () => {
      $(".make-review .fa-star").removeClass('rate-star');
      let value = $(this).attr('id').split('-').pop()
      if (value != 10) $(this).addClass('rate-star');
      $('#review_rating').val(value);
    });
  });
});
