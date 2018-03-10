class CreditCard < ApplicationRecord
  has_many :orders
  belongs_to :user
  validates_presence_of :number, :cvv, :expiration_month, :expiration_year, :first_name, :last_name
end
