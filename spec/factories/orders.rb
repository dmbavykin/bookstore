FactoryBot.define do
  factory :order do
    total_price { rand(1.1...99.9).truncate(2) }
    completed_date { FFaker::Time.date }
    state
  end
end
