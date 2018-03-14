class Order < ApplicationRecord
  include AASM
  belongs_to :user, optional: true
  belongs_to :credit_card, optional: true
  belongs_to :delivery, optional: true
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :order_items
  has_one :coupon
  validates_presence_of :state
  enum state: ['Waiting for processing', 'In delivery', 'Delivered', 'Canceled']
  scope :in_progress, -> { where(state: states['Waiting for processing']) }
  accepts_nested_attributes_for :addresses
end
