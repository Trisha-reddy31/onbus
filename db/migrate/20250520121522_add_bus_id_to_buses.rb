class AddBusIdToBuses < ActiveRecord::Migration[7.2]
  def change
    add_column :buses, :bus_id, :string
  end
end
