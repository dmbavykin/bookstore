FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    firstname { FFaker::Name.first_name}
    lastname { FFaker::Name.last_name}
  end
end
