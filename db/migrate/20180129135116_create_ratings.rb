class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.text :review
      t.integer :rate

      t.timestamps
    end
    add_reference :ratings, :book, index: true
    add_reference :ratings, :customer, index: true
  end
end
