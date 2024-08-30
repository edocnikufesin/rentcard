class CreateRates < ActiveRecord::Migration[7.2]
  def change
    create_table :rates do |t|
      t.integer :dayrate
      t.integer :weekrate
      t.integer :monthrate
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
