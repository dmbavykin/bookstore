class OrderItemsController < ApplicationController
  load_and_authorize_resource

  def index
    return redirect_to root_path, alert: 'You`ve not any books in cart' unless @order.order_items.any?
    @items = @order.order_items.map(&:decorate)
  end

  def create
    if @order.order_items.object.where(book_id: order_items_params[:book_id]).any?
      return redirect_to order_items_path, alert: 'Book alredy added'
    end
    @order.order.order_items.create(order_items_params)
    redirect_to order_items_path, notice: 'Book added successful'
  end

  def update
    params[:increment] ? @order_item.increment!(:quantity) : @order_item.decrement!(:quantity)
    redirect_to order_items_path
  end

  def destroy
    OrderItem.destroy(params[:id])
    redirect_to order_items_path, notice: 'Book successful removed from cart'
  end

  private

  def order_items_params
    params.require(:order_items).permit(:price, :quantity, :book_id)
  end
end
