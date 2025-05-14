class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.string :plan
      t.decimal :price
      t.text :details

      t.timestamps
    end
  end
end
