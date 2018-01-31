FactoryBot.define do
  factory :order do
    total_price { rand(1.1...99.9).to_f.truncate(2) }
    completed_date { FFaker::Time.date }
    state { ['in progress', 'complited', 'shipped'].sample }
  end
end
