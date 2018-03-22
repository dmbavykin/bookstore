class Coupon < ApplicationRecord
  belongs_to :order, optional: true
  validates_presence_of :code, :sale
end
