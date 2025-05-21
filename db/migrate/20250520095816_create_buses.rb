class CreateBuses < ActiveRecord::Migration[7.2]
  def change
    create_table :buses do |t|
      t.string :source
      t.string :destination
      t.date :date
      t.string :timing
      t.string :status

      t.timestamps
    end
  end
end
