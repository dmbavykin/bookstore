class ChangeReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :state, :integer
    add_column :reviews, :confirmed, :boolean, default: false
    add_column :reviews, :verified, :boolean, default: false
    add_column :reviews, :avatar, :string
  end
end
