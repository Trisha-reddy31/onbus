class AddNumberOfTripsToBuses < ActiveRecord::Migration[7.2]
  def change
    add_column :buses, :number_of_trips, :integer
  end
end
