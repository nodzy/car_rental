class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :from
      t.date :to
      t.string :client
      t.string :phone
      t.string :place
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
