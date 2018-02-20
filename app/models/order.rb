class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :credit_card
  has_many :addresses, as: :addressable
  validates :total_price, :completed_date, :state, presence: true
  enum type: ['Waiting for processing', 'In delivery', 'Delivered', 'Canceled']
end
