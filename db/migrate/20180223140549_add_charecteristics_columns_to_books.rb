class AddCharecteristicsColumnsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :width, :decimal, precision: 5, scale: 1
    add_column :books, :height, :decimal, precision: 5, scale: 1
    add_column :books, :depth, :decimal, precision: 5, scale: 1
    add_column :books, :material, :string
    add_column :books, :publication_year, :integer
  end
end
