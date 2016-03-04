class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :class
      t.float :price

      t.timestamps null: false
    end
  end
end
