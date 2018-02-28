class OrderItemsController < ApplicationController
  load_and_authorize_resource

  def index
    return redirect_to root_path, alert: 'You`ve not any books in cart' unless @order.order_items.any?
    @items = @order.order_items.map(&:decorate)
  end

  def create
    return redirect_to order_items_path, alert: 'Book alredy added' if OrderItem.find_by(order: @order)
    @order.order.order_items.create(order_items_params)
    redirect_to order_items_path, notice: 'Book added successful'
  end

  def destroy
    OrderItem.destroy(params[:id])
    redirect_to order_items_path, notice: 'Book successful removed from cart'
  end

  private

  def order_items_params
    params.permit(:price, :quantity, :book_id)
  end
end
