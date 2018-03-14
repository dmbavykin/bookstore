class Delivery < ApplicationRecord
  has_many :orders
  validates_presence_of :title, :days, :price
end
