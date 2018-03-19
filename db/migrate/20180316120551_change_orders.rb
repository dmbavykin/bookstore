class ChangeOrders < ActiveRecord::Migration[5.1]

  def up
    change_column :orders, :state, :string, null: false, default: 'filling'
    add_column :orders, :confirmation_token, :string
    add_column :orders, :track_number, :string
  end

  def down
    change_column :orders, :state, :string, null: false, default: 0
    remove_column :orders, :confirmation_token, :string
    remove_column :orders, :track_number, :string
  end
end
