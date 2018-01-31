class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :credit_card
  has_one :billing_address
  has_one :shipping_address
  validates :total_price, :completed_date, :state, presence: true
end
