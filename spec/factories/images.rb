# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    path { 'image/upload/v1518298646/default.jpg' }
    book
  end
end
