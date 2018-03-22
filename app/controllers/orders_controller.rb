class OrdersController < ApplicationController
  authorize_resource

  def index
    @orders = current_user.orders.executed
    @orders = @orders.by_state(params[:state].to_sym) if valid_state?
  end

  def show
    @_order = Order.find_by(id: params[:id]).decorate
  end

  def confirm
    order = Order.find_by(id: params[:order_id])
    if order.confirmation_token == params[:token]
      order.process
      order.save
      return redirect_to root_path, notice: 'Order confirmed'
    end
    redirect_to root_path, alert: 'Wrong token'
  end

  private

  def valid_state?
    Order.aasm_states.include?(params[:state]&.to_sym)
  end
end
