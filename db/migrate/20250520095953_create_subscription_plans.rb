class CreateSubscriptionPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :subscription_plans do |t|
      t.string :source
      t.string :destination
      t.string :plan_type
      t.decimal :price
      t.integer :number_of_trips

      t.timestamps
    end
  end
end
