class OrdersController < ApplicationController
  def confirm
    order = Order.find_by(id: params[:order_id])
    if order.confirmation_token == params[:token]
      order.process
      order.save
      return redirect_to root_path, notice: 'Order confirmed'
    end
    redirect_to root_path, alert: 'Wrong token'
  end
end
