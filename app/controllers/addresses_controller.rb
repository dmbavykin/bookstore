class AddressesController < ApplicationController
  load_resource

  def create
    @address = current_user.addresses.create(address_params)
    redirect_to edit_user_path(current_user), notice: t('address.successful.create')
  end

  def update
    @address.update(address_params)
    redirect_to edit_user_path(current_user), notice: t('address.successful.update')
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :kind)
  end
end
