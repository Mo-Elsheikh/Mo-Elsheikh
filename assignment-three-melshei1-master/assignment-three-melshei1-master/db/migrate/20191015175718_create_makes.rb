class CreateMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :makes do |t|
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
