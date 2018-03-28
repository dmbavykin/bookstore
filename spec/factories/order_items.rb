# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    price { rand(1.1...99.9).truncate(2) }
    quantity { rand(1..10) }
    book
    order
  end
end
