class OrderItemsController < ApplicationController
  load_and_authorize_resource

  def index
    return redirect_to root_path, alert: t('cart.empty') unless @order.order_items.any?
    @items = @order.order_items.map(&:decorate)
  end

  def create
    if @order.order_items.where(book_id: order_items_params[:book_id]).any?
      return redirect_to order_items_path, alert: t('cart.alredy_added')
    end
    @order.order_items.create(order_items_params)
    redirect_to order_items_path, notice: t('cart.successful_added')
  end

  def update
    params[:increment] ? increment : decrement
    redirect_to order_items_path
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_path, notice: t('cart.removed_successful')
  end

  private

  def order_items_params
    params.require(:order_items).permit(:price, :quantity, :book_id)
  end

  def increment
    return flash[:alert] = t('cart.no_more') if @order_item.quantity == @order_item.book.quantity
    @order_item.increment!(:quantity)
  end

  def decrement
    return flash[:alert] = t('cart.no_less') if @order_item.quantity == 1
    @order_item.decrement!(:quantity)
  end
end
