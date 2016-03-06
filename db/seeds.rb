# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create!(name: 'Honda', comfort_class: 'A', description: 'content')

Car.create!(name: 'Honda', comfort_class: 'B', description: 'content')

#Car.create!(name: 'Honda', comfort_class: 'C', description: content, picture: File.open(Rails.root + "./app/assets/images/macewindu.jpg"))

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
