class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :email, :password, :firstname, :lastname, presence: true
  validates_uniqueness_of :email
end
