class Customer < ApplicationRecord
  has_many :orders
  has_many :ratings
  validates :email, :password, :firstname, :lastname, presence: true
  validates_uniqueness_of :email
end
