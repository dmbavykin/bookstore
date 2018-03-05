FactoryBot.define do
  factory :credit_card do
    number { 16.times.map { rand(10) }.join }
    cvv { rand(111..9999) }
    expiration_month { rand(10..99) }
    expiration_year { rand(10..99) }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
