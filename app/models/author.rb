class Author < ApplicationRecord
  has_many :books
  validates :firstname, :lastname, presence: true
end
