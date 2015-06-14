class AddPropertiesToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :name, :string
    add_column :flowers, :colour, :string
    add_column :flowers, :petals, :integer
    add_column :flowers, :prop1, :string
    add_column :flowers, :prop2, :string
    add_column :flowers, :prop3, :string
    add_column :flowers, :colour2, :string
    add_column :flowers, :colour3, :string
    add_column :flowers, :images, :string
  end
end
