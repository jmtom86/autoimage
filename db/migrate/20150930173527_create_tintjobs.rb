class CreateTintjobs < ActiveRecord::Migration
  def change
    create_table :tintjobs do |t|
      t.references :tint, index: true
      t.references :job, index: true
      t.decimal :cost

      t.timestamps
    end
  end
end
