class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  [CanCan::AccessDenied, ActiveRecord::RecordNotFound, ActionController::RoutingError].each do |error|
    rescue_from error do |exception|
      redirect_to main_app.root_path, alert: exception.message
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user_or_guest)
  end

  def current_user_or_guest
    current_user || guest_user
  end

  def guest_user
    return User.find(session[:guest_user_id]) if session[:guest_user_id]
    user_guest = User.new(:email => "guest_#{Time.now.to_i}#{rand(100)}@guest.com")
    user_guest.save!(:validate => false)
    session[:guest_user_id] = user_guest.id
    user_guest
  end
end
