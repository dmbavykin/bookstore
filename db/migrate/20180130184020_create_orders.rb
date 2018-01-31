class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 6, scale: 2, null: false
      t.date :completed_date, null: false
      t.string :state, null: false, default: 'in progress'
      t.belongs_to :customer, index: true
      t.belongs_to :credit_card, index: true

      t.timestamps
    end
  end
end
