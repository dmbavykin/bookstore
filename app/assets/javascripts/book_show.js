$(document).on("turbolinks:load", () => {
  const input = $('#order_items_quantity');
  let val = input.val();

  $('#decrement-book-quantity').on('click', (event) => {
    event.preventDefault();
    if (input.val() > 1) {
      val = +val - 1
      input.val(val);
      return val;
    }
  });

  $('#increment-book-quantity').on('click', (event) => {
    event.preventDefault();
    val = +val + 1
    input.val(val);
    return val;
  });

});
