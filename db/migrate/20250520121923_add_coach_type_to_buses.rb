class AddCoachTypeToBuses < ActiveRecord::Migration[7.2]
  def change
    add_column :buses, :coach_type, :string
  end
end
