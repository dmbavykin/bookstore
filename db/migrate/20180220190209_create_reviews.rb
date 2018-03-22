class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :comment_text, null: false, default: ''
      t.string :name, null: false, default: ''
      t.integer :state, null: false
      t.integer :rating
      t.timestamps
    end

    add_reference :reviews, :book, index: true
    add_reference :reviews, :user, index: true
  end
end
