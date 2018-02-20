class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @billing_address = current_user.addresses.find_or_initialize_by(kind: 0)
    @shipping_address = current_user.addresses.find_or_initialize_by(kind: 1)
  end
end
