class AddUserIdToSubscriptions < ActiveRecord::Migration[7.2]
  def change
    add_column :subscriptions, :user_id, :integer
    add_index :subscriptions, :user_id
  end
end
