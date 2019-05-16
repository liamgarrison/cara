jim = User.create(first_name: "Jim", last_name: "White", email: "jimwhite@gmail.com", password: 1234)
Vehicle.create(name: "Misty", berths: 2, owner: jim, address: "138 Kingsland Road, London", price_per_night: 22, category: "Caravan", description: "lorem " * 30)
