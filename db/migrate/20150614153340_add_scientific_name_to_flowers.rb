class AddScientificNameToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :scientific, :string
  end
end
