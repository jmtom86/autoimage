class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :customer, index: true
      t.string :make
      t.string :model
      t.integer :year
      t.decimal :total
      t.date :date

      t.timestamps
    end
  end
end
