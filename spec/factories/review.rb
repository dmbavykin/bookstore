FactoryBot.define do
  factory :review do
    comment_text { FFaker::Tweet.body }
    rating { rand(1..10) }
    state { 0 }
    name { FFaker::Name.name }
    book
    user
  end
end