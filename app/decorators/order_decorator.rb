class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_item

  def sale
    coupon ? coupon.sale : 0.0
  end

  def subtotal
    order_items.map(&:decorate).map(&:subtotal).reduce(&:+)
  end

  def total
    subtotal - sale 
  end
end
