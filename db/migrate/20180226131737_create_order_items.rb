class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :quantity, null: false
    end
    add_reference :order_items, :book, index: true
    add_reference :order_items, :order, index: true
  end
end
