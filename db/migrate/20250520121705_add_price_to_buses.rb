class AddPriceToBuses < ActiveRecord::Migration[7.2]
  def change
    add_column :buses, :price, :integer
  end
end
