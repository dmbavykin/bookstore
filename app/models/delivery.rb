class Delivery < ApplicationRecord
  has_many :orders, dependent: :nullify
  validates_presence_of :title, :days, :price
end
