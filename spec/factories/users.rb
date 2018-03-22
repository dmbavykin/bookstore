FactoryBot.define do
  factory :user do
    after(:build, &:skip_confirmation_notification!)
    after(:create, &:confirm)

    email { FFaker::Internet.email }
    password '123456'
    password_confirmation '123456'
  end
end
