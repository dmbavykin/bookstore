class CreditCard < ApplicationRecord
  has_many :orders
  validates_presence_of :number, :cvv, :expiration_month, :expiration_year, :first_name, :last_name
end
