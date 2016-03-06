# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create!(name: 'Honda', comfort_class: 'A', description: 'Year: 2015, Engine: 4.7, Horsepower: 449, Fuel: Gasoline', picture: File.open(File.join(Rails.root, "/app/assets/images/#{mercedes}.jpg")))

Car.create!(name: 'Honda', comfort_class: 'B', description: 'Year: 2014, Engine: 1.4, Horsepower: 150, Fuel: Gasoline', picture: File.open(File.join(Rails.root, "/app/assets/images/#{passat}.jpg")))

Car.create!(name: 'Honda', comfort_class: 'C', description: 'Year: 2014, Engine: 1.1, Horsepower: 54, Fuel: Gasoline', picture: File.open(File.join(Rails.root, "/app/assets/images/#{fiat}.jpg")))

4.times do
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'B',
                description: content
               )
  end
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'C',
                description: content
               )
  end
  3.times do
    name = Faker::Name.last_name
    content = Faker::Lorem.sentence(5)

    Car.create!(name:  name,
                comfort_class: 'A',
                description: content
               )
  end
end
# Microposts
cars = Car.order(:created_at).take(20)
cars.each do |car|
  name  = Faker::Name.name
  phone = Faker::PhoneNumber.cell_phone
  starting = Faker::Date.between(Date.tomorrow, 1.year.from_now)
  ending = Faker::Date.between(starting + 1, starting + 1.month)
  car.bookings.create!(starting: starting, ending: ending, client: name, place: 'New York, 55 East 52nd Street', phone: phone)
end
