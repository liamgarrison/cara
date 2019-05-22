Review.destroy_all
Booking.destroy_all
Vehicle.destroy_all
User.destroy_all

# Realistic addresses
addresses = %w[glasgow edinburgh newcastle birmingham manchester leeds bristol shoreditch vauxhall southampton]

# User seeds
10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 123456,
    remote_photo_url: "https://kitt.lewagon.com/placeholder/users/liamgarrison",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit adipisci accusantium, libero consectetur omnis, exercitationem rem dignissimos nemo, obcaecati esse ipsam veniam, laboriosam tenetur? Quae id magni harum quo odio!"
  })
end

10.times do |index|
  Vehicle.create!({
    owner: User.all.sample,
    name: Faker::Name.first_name,
    address: addresses[index],
    berths: (1..5).to_a.sample,
    description: Faker::Lorem.sentences(10).join(" "),
    price_per_night: (10..50).to_a.sample,
    category: ["Campervan", "Caravan", "Trailer Tent", "Motorhome"].sample,
    remote_photo_url: "https://images.unsplash.com/photo-1543395136-75b39bc00e0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
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
