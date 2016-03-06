class RenameCarsClassColumn < ActiveRecord::Migration
  def change
    rename_column :cars, :class, :comfort_class
  end
end
