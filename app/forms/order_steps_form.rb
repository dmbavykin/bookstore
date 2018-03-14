class OrderStepsForm
  include ActiveModel::Model
  attr_accessor :billing_address, :shipping_address, :deliveries, :credit_card

  def initialize(order)
    @order = order
    @billing_address ||= address(:billing)
    @shipping_address ||= address(:shipping)
    @deliveries ||= Delivery.where(active: true)
    @credit_card ||= set_card
  end

  def update(step, params)
    case step
    when :address then update_addresses(params)
    when :delivery then update_delivery(params)
    when :payment then update_payment(params)
    end
  end

  def get_step
    case false
    when @billing_address.valid? && @shipping_address.valid? then :address
    when !@order.delivery.nil? then :delivery
    when !@order.credit_card.nil? then :payment
    else :confirm
    end
  end

  private

  def address(kind)
    return @order.addresses.find_by(kind: kind) if @order.addresses.find_by(kind: kind)
    user_address = @order.user.addresses.find_by(kind: kind)
    user_address ? user_address.dup : @order.addresses.build(kind: kind)
  end

  def update_addresses(params)
    @order.update(use_billing: params[:use_billing])
    @billing_address = update_address(:billing, params[:billing_address])
    update_shipping_address(params)
    @billing_address.errors.empty? && @shipping_address.errors.empty?
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

  def update_delivery(params)
    @order.update(delivery_id: params[:delivery])
  end

  def update_payment(params)
    @credit_card.update(params[:credit_card])
    @order.update(credit_card_id: credit_card) if @credit_card.errors.empty?
  end

  def set_card
    @order.credit_card || @order.user.credit_cards.last || CreditCard.new(user: @order.user)
  end
end
