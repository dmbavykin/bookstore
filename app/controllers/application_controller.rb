class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order

  [CanCan::AccessDenied, ActiveRecord::RecordNotFound, ActionController::RoutingError].each do |error|
    rescue_from error do |exception|
      redirect_to main_app.root_path, alert: exception.message
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
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

  def current_order
    Order.find_by_id(session[:order_id]) || current_user.orders.where(state: 0).last || new_session_order
  end

  private

  def set_order
    @order = current_order
  end

  def new_session_order
    order = Order.create(user: current_user)
    session[:order_id] = order.id
    order
  end
end
