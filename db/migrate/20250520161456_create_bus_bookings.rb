class CreateBusBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bus_bookings do |t|
      t.string :pnr, null: false
      t.string :bus_name, null: false
      t.decimal :fare, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :bus_bookings, :pnr, unique: true
  end
end
