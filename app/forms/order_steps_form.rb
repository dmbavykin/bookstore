class OrderStepsForm
  include ActiveModel::Model
  attr_accessor :billing_address, :shipping_address

  def initialize(order)
    @order = order
    @billing_address ||= address(:billing)
    @shipping_address ||= address(:shipping)
  end

  def update(step, params)
    case step
    when :address then !update_addresses(params)
    end
  end

  def address(kind)
    return @order.addresses.find_by(kind: kind) if @order.addresses.find_by(kind: kind)
    user_address = @order.user.addresses.find_by(kind: kind)
    user_address ? user_address.dup : @order.addresses.build(kind: kind)
  end

  def update_addresses(params)
    @order.update(use_billing: params[:use_billing])
    @billing_address = update_address(:billing, params[:billing_address])
    update_shipping_address(params)
    @billing_address.errors.any? || @shipping_address.errors.any?
  end

  def update_shipping_address(params)
    params_key = @order.use_billing ? :billing_address : :shipping_address
    shipping_params = params[params_key]
    shipping_params[:kind] = :shipping
    @shipping_address = update_address(:shipping, shipping_params)
  end

  def update_address(kind, params)
    address = @order.addresses.find_by(kind: kind)
    address ? address.update(params) : address = @order.addresses.create(params)
    address
  end
end
