class AddTintNameToTintjob < ActiveRecord::Migration
  def change
    add_column :tintjobs, :tint_name, :string
  end
end
