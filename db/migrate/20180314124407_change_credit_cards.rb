class ChangeCreditCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :credit_cards, :first_name, :string, null: false
    remove_column :credit_cards, :last_name, :string, null: false
    remove_column :credit_cards, :expiration_month, :integer, null: false
    remove_column :credit_cards, :expiration_year, :integer, null: false
    add_column :credit_cards, :card_name, :string, null: false
    add_column :credit_cards, :expiration_date, :string, null: false
  end
end
