FactoryBot.define do
  factory :author do
    firstname { FFaker::Name.first_name}
    lastname { FFaker::Name.last_name}
    biography { FFaker::Tweet.body }
  end
end
