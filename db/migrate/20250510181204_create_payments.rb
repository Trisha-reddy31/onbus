class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :account_number
      t.string :expiry_date
      t.string :cvv
      t.integer :customer_id

      t.timestamps
    end
  end
end
