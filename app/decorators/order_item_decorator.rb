class OrderItemDecorator < ApplicationDecorator
  delegate_all

  def subtotal
    book.price * quantity
  end
end
