class Author < ApplicationRecord
  has_many :books, dependent: :delete_all
  validates :firstname, :lastname, presence: true
end
