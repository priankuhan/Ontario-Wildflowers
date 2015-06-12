class AddPropertiesToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :colour, :string
    add_column :flowers, :petals, :integer
    add_column :flowers, :ident1, :string
    add_column :flowers, :ident2, :string
    add_column :flowers, :ident3, :string
  end
end
