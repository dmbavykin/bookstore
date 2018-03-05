class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :order_items
  has_one :coupon
  validates_presence_of :state
  enum state: ['Waiting for processing', 'In delivery', 'Delivered', 'Canceled']
  scope :in_progress, -> { where(state: 0) }
end
