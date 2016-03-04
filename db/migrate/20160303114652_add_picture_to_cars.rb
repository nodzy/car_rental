class AddPictureToCars < ActiveRecord::Migration
  def change
    add_column :cars, :picture, :string
  end
end
