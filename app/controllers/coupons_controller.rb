class CouponsController < ApplicationController
  def create
    coupon = Coupon.find_by(code: coupon_params[:code])
    binding.pry
    return redirect_to order_items_path, alert: 'Coupon alredy used' if coupon.order
    @order.coupon = coupon
    redirect_to order_items_path, notice: 'Coupon added'
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
