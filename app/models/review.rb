class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum state: ['unapproved', 'approved', 'verified']
  validates :comment_text, :rating, :name, :state, presence: true
end
