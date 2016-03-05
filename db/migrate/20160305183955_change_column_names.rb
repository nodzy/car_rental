class ChangeColumnNames < ActiveRecord::Migration
  def change
  rename_column :bookings, :from, :starting
  rename_column :bookings, :to, :ending
  end
end
