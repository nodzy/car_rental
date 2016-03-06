task remove_bookings: :environment do
  Booking.remove_bookings
end
