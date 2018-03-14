class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete
  before_action :check_order, :relate_with_user, :set_form

  def show
    render_wizard
  end

  def update
    redirect_to_step(next_step) and return if @form.update(step, order_params)
    render_wizard
  end

  private

  def check_order
    redirect_to root_path, alert: 'Your cart are empty' unless OrderItem.where(order: @order).any?
  end

  def relate_with_user
    @order.update(user: current_user) unless @order.user
  end

  def set_form
    @form = OrderStepsForm.new(@order)
  end

  def redirect_to_step(step)
    redirect_to wizard_path(step)
  end

  def order_params
    params.permit(
      :use_billing,
      :delivery,
      credit_card: %i[number cvv card_name expiration_date],
      billing_address:  %i[first_name last_name address city zip country phone kind],
      shipping_address: %i[first_name last_name address city zip country phone kind]
    )
  end
end
