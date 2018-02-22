$(() => {
  $('#delete_account_form .checkbox-input').on('click', () => {
    $('#delete_account_btn').toggleClass('disabled').toggleAttr('disabled');
  });
  $('#change_password_form .form-control').each(() => {
    $(this).on('keyup', () => {
      let state = $("#change_password_form .form-control").filter(function () {
        return $.trim($(this).val()).length == 0
      }).length == 0;

      if (state) {
        $('#change_password_btn').removeClass('disabled').removeAttr('disabled');
      } else {
        $('#change_password_btn').addClass('disabled').attr('disabled', true);
      }
    });
  });
});
