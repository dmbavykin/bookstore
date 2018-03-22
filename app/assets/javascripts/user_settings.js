$(document).on("turbolinks:load", function() {
  $('#delete_account_form .checkbox-input').on('click', function() {
    $('#delete_account_btn').toggleClass('disabled').toggleAttr('disabled');
  });
  $('#change_password_form .form-control').each(function() {
    $(this).on('keyup', function() {
      var state = $("#change_password_form .form-control").filter(function () {
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
