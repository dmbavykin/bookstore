class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :books, :categories
    add_foreign_key :credit_cards, :users
    add_foreign_key :images, :books
    add_foreign_key :order_items, :books
    add_foreign_key :order_items, :orders
    add_foreign_key :reviews, :books
    add_foreign_key :reviews, :users
  end
end
