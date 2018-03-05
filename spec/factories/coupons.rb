FactoryBot.define do
  factory :coupon do
    code { FFaker::Color.hex_code }
    sale { rand(1.1..99.9).truncate(2) }
    order

    trait :invalid do
      code nil
    end

    trait :without_order do
      order nil
    end
  end
end
