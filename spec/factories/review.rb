# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    comment_text { FFaker::Tweet.body }
    rating { rand(1..10) }
    name { FFaker::Name.name }
    verified { false }
    confirmed { false }
    book
    user

    trait :invalid do
      rating nil
    end

    trait :with_book_id do
      transient do
        book_id nil
      end
    end
  end
end
