
Booking.destroy_all
Vehicle.destroy_all
User.destroy_all

# User seeds
10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 123456
  })
end

10.times do
  Vehicle.create!({
    owner: User.all.sample,
    name: Faker::Name.first_name,
    address: Faker::Address.full_address,
    berths: (1..5).to_a.sample,
    description: Faker::Lorem.sentences(10),
    price_per_night: (10..50).to_a.sample,
    category: ["Campervan", "Caravan", "Trailer Tent", "Motorhome"].sample
  })
end

10.times do
  Booking.create!({
    vehicle: Vehicle.all.sample,
    renter: User.all.sample,
    start_date: Date.new(2019, 6, 15),
    number_of_nights: (1..5).to_a.sample
  })
end
