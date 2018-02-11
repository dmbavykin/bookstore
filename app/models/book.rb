class Book < ApplicationRecord
  has_many :ratings
  has_many :images
  belongs_to :category
  belongs_to :author
  validates :title, :price, :quantity, presence: true
end
