class CreateSeats < ActiveRecord::Migration[7.2]
  def change
    create_table :seats do |t|
      t.references :bus, null: false, foreign_key: true
      t.string :number
      t.boolean :booked

      t.timestamps
    end
  end
end
