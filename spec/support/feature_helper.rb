module FeatureHelper
  def sign_in(user, location = nil)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    first('[name = commit]').click
    visit(location) if location
  end
end
