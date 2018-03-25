class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.decimal :sale, precision: 5, scale: 2, null: false
      t.belongs_to :order, index: true
    end
  end
end
