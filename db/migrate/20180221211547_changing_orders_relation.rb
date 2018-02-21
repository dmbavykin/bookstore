class ChangingOrdersRelation < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orders, :customer, index: true
    add_reference :orders, :user, index: true
  end
end
