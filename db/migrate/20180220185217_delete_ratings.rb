class DeleteRatings < ActiveRecord::Migration[5.1]
  def up
    drop_table :ratings
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted table ratings"
  end
end
