class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :from, :date
    add_column :bookings, :to, :date
  end
end
