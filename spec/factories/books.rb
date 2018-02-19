FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { rand(1.1...99.9).to_f.truncate(2) }
    quantity { rand(1..100) }
    author
    category
  end
end
