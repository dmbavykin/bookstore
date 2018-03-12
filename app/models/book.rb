class Book < ApplicationRecord
  FILTERS = {
    newest: 'Newest first',
    popular: 'Popular first',
    price_asc: 'Price: Low to high',
    price_desc: 'Price: High to low',
    by_title_asc: 'Title: A - Z',
    by_title_desc: 'Title: Z - A'
  }.freeze
  DEFAULT_FILTER = :newest

  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :order_items
  belongs_to :category
  has_and_belongs_to_many :authors
  validates :title, :price, :quantity, presence: true
  validates_numericality_of :publication_year, less_than_or_equal_to: Time.current.year
  validates_numericality_of :height, :width, :depth, greater_than: 0

  scope :for_slider, -> { order(:created_at).last(3) }
  scope :best_sellers, -> { order(:created_at).last(4) }
  scope :newest, -> { order('created_at DESC') }
  scope :popular, -> { order('created_at DESC') }
  scope :price_asc, -> { order('price') }
  scope :price_desc, -> { order('price DESC') }
  scope :by_title_asc, -> { order('title') }
  scope :by_title_desc, -> { order('title DESC') }
  scope :by_filter, ->(filter, page) { public_send(filter).page(page) }
end
