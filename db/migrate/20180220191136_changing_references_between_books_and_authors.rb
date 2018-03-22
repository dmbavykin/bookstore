class ChangingReferencesBetweenBooksAndAuthors < ActiveRecord::Migration[5.1]
  def change
    remove_reference :books, :author, index: true

    create_table :authors_books, id: false do |t|
      t.references :book, index: true
      t.references :author, index: true
    end

    add_index :authors_books, %i[book_id author_id]
  end
end
