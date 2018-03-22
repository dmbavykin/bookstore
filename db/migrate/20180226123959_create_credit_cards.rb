class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false
      t.integer :cvv, null: false
      t.integer :expiration_month, null: false
      t.integer :expiration_year, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
