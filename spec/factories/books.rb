FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { rand(1.1...99.9).truncate(2) }
    quantity { rand(1..100) }
    width { rand(1..100) }
    height { rand(1..100) }
    depth { rand(1..100) }
    material { 'Paper' }
    publication_year { Time.now.year }
    category
  end
end
