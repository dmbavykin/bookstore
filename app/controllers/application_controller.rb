class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order

  [CanCan::AccessDenied, ActiveRecord::RecordNotFound, ActionController::RoutingError].each do |error|
    rescue_from error do |exception|
      redirect_to main_app.root_path, alert: exception.message
    end
  end

  def current_order
    (Order.find_by(id: session[:order_id]) || current_user&.orders&.in_progress&.last || new_session_order).decorate
  end

  private

  def set_order
    @order ||= current_order
  end

  def new_session_order
    order = Order.create
    session[:order_id] = order.id
    order
  end
end
