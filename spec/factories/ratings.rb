FactoryBot.define do
  factory :rating do
    review { FFaker::Tweet.body }
    rate { rand(1..10) }
    book_id { rand(1..10) }
    customer_id { rand(1..10) }
  end
end
