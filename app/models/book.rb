class Book < ApplicationRecord
  has_many :ratings
  has_many :images
  belongs_to :category
  belongs_to :author
  validates :title, :price, :quantity, presence: true
  scope :for_slider, -> { last(3) }
  scope :best_sellers, -> { last(4) }
end
