FactoryBot.define do
  factory :delivery do
    title { FFaker::Book.title }
    days { FFaker::Book.description }
    price { rand(1.1...99.9).truncate(2) }
    active { true }
  end
end
