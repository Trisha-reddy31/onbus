class CreateCustomerDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :customer_details do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :contact
      t.string :plan
      t.decimal :price
      t.date :date_of_issue
      t.date :date_of_expiry
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
