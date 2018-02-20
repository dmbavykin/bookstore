class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  enum kind: %i(billing shipping)
  scope :shipping, -> { where(kind: 'shipping').first }
  scope :billing, -> { where(kind: 'billing').first }
end
