# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jim = User.create(first_name: "Jim", last_name: "White", email: "jimwhite@gmail.com", password: 1234)

Vehicle.create(name: "Misty", berths: 2, owner: jim, address: "138 Kingsland Road, London", price_per_night: 22, category: "Caravan", description: "lorem " * 30)
