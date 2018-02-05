FactoryBot.define do
  factory :rating do
    review { FFaker::Tweet.body }
    rate { rand(1..10) }
    book_id { Book.find(rand(Book.first.id..Book.last.id)).id }
    customer_id { Customer.find(rand(Customer.first.id..Customer.last.id)).id }
  end
end
