class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :vin_number
      t.integer :many_part

      t.timestamps
    end
  end
end
