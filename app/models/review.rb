class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :comment_text, :rate, presence: true
  enum type: ['unapproved', 'approved', 'verified']
end
