class AddressesController < ApplicationController
  load_resource

  def create
    @address = current_user.addresses.create(address_params)
    @address.errors.any? ? flash[:alert] = t('address.failure.create') : flash[:notice] = t('address.successful.create')
    redirect_to edit_user_registration_path
  end

  def update
    @address.update(address_params)
    @address.errors.any? ? flash[:alert] = t('address.failure.update') : flash[:notice] = t('address.successful.update')
    redirect_to edit_user_registration_path
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :kind)
  end
end
