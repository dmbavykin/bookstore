FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { rand(1.1...99.9).to_f.truncate(2) }
    quantity { rand(1..100) }
    category_id { Category.find(rand(1..Category.count)).id }
    author_id { Author.find(rand(1..Author.count)).id }
  end
end
