require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
User.destroy_all
Mover.destroy_all

puts "Creating Users and Movers and Bookings..."
50.times do 
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    address: Faker::Address.street_address ,
  )

  Mover.create!(
    user: user,
    name: Faker::Name.name,
    # size_of_car: Mover::SIZE_OF_CARS.sample,
    type_of_car: Faker::Vehicle.manufacture, 
    type_of_car: Faker::Vehicle.make_and_model
    description: Faker::ChuckNorris.fact,
    price: Faker::Number.number(digits: 4),
  )
end

 user = User.create!(
    name: "Sho",
    email: "ikirenohs@gmail.com",
    password: "password",
    address: Faker::Address.street_address,
  )
  booking = Booking.create!(
    user: user,
    mover: Mover.all.sample,
    date_time: DateTime.now + rand(5..10).days,
    start_point:Faker::Address.street_address,
    end_point:Faker::Address.street_address,
    status: "",
    description: "description", 
  )
  user = User.create!(
    name: "Aline",
    email: "as.utiyama@gmail.com",
    password: "password",
    address: Faker::Address.street_address ,
  )
  booking = Booking.create!(
    user: user,
    mover: Mover.all.sample,
    date_time: DateTime.now + rand(5..10).days,
    start_point:Faker::Address.street_address,
    end_point:Faker::Address.street_address,
    status: "",
    description: "description", 
  )
  user = User.create!(
    name: "Alex",
    email: "alexandre.ealimentos@gmail.com",
    password: "password",
    address: Faker::Address.street_address ,
  )
  booking = Booking.create!(
    user: user,
    mover: Mover.all.sample,
    date_time: DateTime.now + rand(5..10).days,
    start_point:Faker::Address.street_address,
    end_point:Faker::Address.street_address,
    status: "",
    description: "description", 
  )


puts "...Created #{User.count} users and #{Mover.count} movers and #{Booking.count} bookings"