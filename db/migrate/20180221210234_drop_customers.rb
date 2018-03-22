class DropCustomers < ActiveRecord::Migration[5.1]
  def up
    drop_table :customers
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted table customers"
  end
end
