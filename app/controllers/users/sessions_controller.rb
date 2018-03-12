# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    update_order if @order
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def update_order
    previous_order = resource.orders&.in_progress&.first
    previous_order ? update_previous_order(previous_order) : @order.update(user: resource)
  end

  def update_previous_order(previous_order)
    @order.order_items.each do |order_item|
      order_item.update(order_id: previous_order.id) unless previous_order.order_items.where(book_id: order_item.book_id).any?
    end
    @order.destroy
  end
end
