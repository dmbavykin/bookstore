class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :path, null: false

      t.timestamps
    end
    add_reference :images, :book, index: true
  end
end
