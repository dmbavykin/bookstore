class Book < ApplicationRecord
  FILTERS = {
    newest: 'Newest first',
    popular: 'Popular first',
    low_to_high: 'Price: Low to high',
    high_to_low: 'Price: High to low',
    by_name: 'Title: A - Z',
    by_name_desc: 'Title: Z - A'
  }.freeze
  has_many :ratings
  has_many :images
  belongs_to :category
  belongs_to :author
  validates :title, :price, :quantity, presence: true
  scope :for_slider, -> { last(3) }
  scope :best_sellers, -> { last(4) }
  scope :newest, -> { order('created_at DESC') }
  scope :low_to_high, -> { order('price') }
  scope :high_to_low, -> { order('price DESC') }
  scope :by_name, -> { order('title') }
  scope :by_name_desc, -> { order('title DESC') }
end
