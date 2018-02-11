FactoryBot.define do
  factory :image do
    path { 'image/upload/v1518298646/default.jpg' }
    book_id { Book.find(rand(Book.first.id..Book.last.id)).id }
  end
end
