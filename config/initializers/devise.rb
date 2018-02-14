
Devise.setup do |config|
  require 'devise/orm/active_record'
  config.mailer_sender = 'bookstore@office.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11

  # Send a notification email when the user's password is changed.
  # config.send_password_change_notification = false
  # config.confirm_within = 3.days
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  config.secret_key = '267916bf4e0be65649a3fec21d26e1e23985fe8d2eb7452587c21b6918eed273712cec706c0bb0efb9af9d36b418a4ac74f625713b92e143866405cb274ceb21'
  config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
