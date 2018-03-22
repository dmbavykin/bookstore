class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false

      t.timestamps
    end
  end
end
