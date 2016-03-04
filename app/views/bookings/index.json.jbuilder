json.array!(@bookings) do |booking|
  json.extract! booking, :id, :from, :to, :client, :phone, :place, :car_id
  json.url booking_url(booking, format: :json)
end
