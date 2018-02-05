FactoryBot.define do
  factory :rating do
    review { FFaker::Tweet.body }
    rate { rand(1..10) }
    book_id { Book.find(rand(1..Book.count)).id }
    customer_id { Customer.find(rand(1..Customer.count)).id }
  end
end
