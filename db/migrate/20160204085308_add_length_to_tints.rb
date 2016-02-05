class AddLengthToTints < ActiveRecord::Migration
  def change
    add_column :tints, :length, :string
  end
end
