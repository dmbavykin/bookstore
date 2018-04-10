# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :book
  validates :path, presence: true
  mount_uploader :path, ImageUploader
end
