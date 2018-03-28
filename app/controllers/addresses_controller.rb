# frozen_string_literal: true

class AddressesController < ApplicationController
  load_resource

  def create
    @address = current_user.addresses.create(address_params)
    set_flash(:create)
    redirect_to edit_user_registration_path
  end

  def update
    @address.update(address_params)
    set_flash(:update)
    redirect_to edit_user_registration_path
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :kind)
  end

  def set_flash(action)
    @address.errors.any? ? flash[:alert] = t("address.failure.#{action}") : flash[:notice] = t("address.successful.#{action}")
  end
end
