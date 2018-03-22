class AddAuthorAndCategoryRefToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :author, index: true
    add_reference :books, :category, index: true
  end
end
