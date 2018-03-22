class ChangingOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :state, :string, null: false, default: 'in progress'
    remove_reference :orders, :credit_card, index: true
    add_column :orders, :state, :integer, null: false, default: 0
    change_column :orders, :total_price, :decimal, precision: 6, scale: 2, null: true
    change_column :orders, :completed_date, :date, null: true
  end
end
