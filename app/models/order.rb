class Order < ApplicationRecord
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :order_items
  enum state: ['Waiting for processing', 'In delivery', 'Delivered', 'Canceled']
end
