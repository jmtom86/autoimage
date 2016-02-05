class CreateTints < ActiveRecord::Migration
  def change
    create_table :tints do |t|
      t.string :name
      t.date :date_bought
      t.date :date_sold
      t.decimal :cost
      t.boolean :done

      t.timestamps
    end
  end
end
