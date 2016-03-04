class RemoveColumnsFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :from, :string
    remove_column :bookings, :to, :string
  end
end
