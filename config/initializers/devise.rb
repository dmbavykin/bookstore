
# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'
  config.mailer_sender = 'bookstore@office.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.secret_key = '267916bf4e0be65649a3fec21d26e1e23985fe8d2eb7452587c21b6918eed273712cec706c0bb0efb9af9d36b418a4ac74f625713b92e143866405cb274ceb21'
  config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
