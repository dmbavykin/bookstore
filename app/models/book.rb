class Book < ApplicationRecord
  FILTERS = {
    newest: 'Newest first',
    popular: 'Popular first',
    low_to_high: 'Price: Low to high',
    high_to_low: 'Price: High to low',
    by_title: 'Title: A - Z',
    by_title_desc: 'Title: Z - A'
  }.freeze
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category
  has_and_belongs_to_many :author
  validates :title, :price, :quantity, presence: true
  scope :for_slider, -> { last(3) }
  scope :best_sellers, -> { last(4) }
  scope :newest, -> { order('created_at DESC') }
  scope :low_to_high, -> { order('price') }
  scope :high_to_low, -> { order('price DESC') }
  scope :by_title, -> { order('title') }
  scope :by_title_desc, -> { order('title DESC') }
end
