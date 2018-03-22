class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment_text, :rating, :name, presence: true
  scope :confirmed, -> { where(confirmed: true) }
end
