json.array!(@cars) do |car|
  json.extract! car, :id, :name, :description, :class, :price
  json.url car_url(car, format: :json)
end
