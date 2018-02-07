class Book < ApplicationRecord
  has_many :ratings
  belongs_to :category
  belongs_to :author
  validates :title, :price, :quantity, presence: true
  mount_uploader :image, ImageUploader
end
