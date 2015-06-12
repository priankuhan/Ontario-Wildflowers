class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|

      t.timestamps null: false
    end
  end
end
