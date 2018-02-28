class CouponsController < ApplicationController
  def create
    coupon = Coupon.find_by(code: coupon_params[:code])
    return redirect_to order_items_path, alert: 'Coupon does not exist' unless coupon
    return redirect_to order_items_path, alert: 'Coupon alredy used' if coupon.order
    @order.update(coupon: coupon)
    redirect_to order_items_path, notice: 'Coupon added'
  end

  def destroy
    Coupon.find(params[:id]).update(order_id: nil)
    redirect_to order_items_path, notice: 'Coupon removed'
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
