class Rating < ApplicationRecord
  belongs_to :customer
  belongs_to :book
  validates :review, :rate, presence: true
end
