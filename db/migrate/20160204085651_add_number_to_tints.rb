class AddNumberToTints < ActiveRecord::Migration
  def change
    add_column :tints, :roll_number, :string
  end
end
