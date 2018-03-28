# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :order, optional: true
  validates :code, :sale, presence: true
end
