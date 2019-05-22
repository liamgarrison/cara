Review.destroy_all
Booking.destroy_all
Vehicle.destroy_all
User.destroy_all

  user1 = User.create!({
    first_name: "Liam",
    last_name: "Garrison",
    email: "liam@gmail.com",
    password: 123456,
    remote_photo_url: "https://kitt.lewagon.com/placeholder/users/liamgarrison",
    description: "Completed my chemistry masters degree at Oxford in 2016, worked as a management consultant and then started my own business called PictureVan, a photography studio in a van! In 2019 I decided to switch careers and learn to code as I love building things. I'm interested in projects that use machine learning to help us create a sustainable society for the future."
  })

  user2 = User.create!({
    first_name: "Corrie",
    last_name: "Mosley",
    email: "corrie@gmail.com",
    password: 123456,
    remote_photo_url: "https://kitt.lewagon.com/placeholder/users/corriemosley",
    description: "I have been working in end-user support at a tech startup in London for the past 3 and half years and am learning to code so I can fix problems instead of just reporting them!"
  })

  user3 = User.create!({
    first_name: "Tom",
    last_name: "Dove",
    email: "tom@gmail.com",
    password: 123456,
    remote_photo_url: "https://kitt.lewagon.com/placeholder/users/tomdove",
    description: "Recently sold my lettings agency and decided to make the move into tech after seeing all the opportunities that are available. After the course I would like to get a job as a software developer."
  })

  user4 = User.create!({
    first_name: "Che",
    last_name: "To",
    email: "che@gmail.com",
    password: 123456,
    remote_photo_url: "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    description: "I love going to festivals with my friends and I use Cara to rent camper vans."
  })

  user5 = User.create!({
    first_name: "Bob",
    last_name: "Jones",
    email: "bobjones@gmail.com",
    password: 123456,
    remote_photo_url: "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=forma,t&fit=crop&w=800&q=80",
    description: "I love going to festivals with my friends and I use Cara to rent camper vans."
  })

  Vehicle.create!({
    owner:  user1,
    name: "Mystery Machine",
    address: "Birchen Grove, Kingsbury, London NW9 8SE",
    berths: 4,
    description: "The all new Mileo 282 2018 model has crisp contemporary styling. The flexible 4 berth layout has two spacious living areas to suit both couples and families with two height adjustable electric drop down beds that can be stowed away in seconds. ",
    price_per_night: 100,
    category: "Campervan",
    remote_photo_url: "https://images.pexels.com/photos/2651/car-vehicle-vintage-driving.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  })

  Vehicle.create!({
    owner: user2,
    name: "Misty Camper",
    address: "The Glebe, Blackheath, London SE3 9TU",
    berths: 4,
    description: "This modern look luxury motorhome is ideal for couples, families or groups of friends as it offers flexible accommodation with plenty of storage space. It works great for a family of four, with a fixed double bed at the front and two bunk beds at the rear.",
    price_per_night: 180,
    category: "Motorhome",
    remote_photo_url: "https://images.pexels.com/photos/1555453/pexels-photo-1555453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  })

  Vehicle.create!({
    owner: user3,
    name: "Pennine Quartz",
    address: "6 Victoria Drive, Putney, Wimbledon, London SW19 6AB",
    berths: 6,
    description: "The Pennine Quartz 4 Folding Camper was introduced in 2010. It is a top of the range medium-sized model.
    This particular model was only produce by Pennine for a very limited time and examples are rare.
    The big difference with the Quartz 4 is its beautiful internal layout, which was a leader of its time in 2011 when first produced and had never been seen before in the Pennine range, or any other, nor has it been reproduced since",
    price_per_night: 180,
    category: "Trailer Tent",
    remote_photo_url: "https://images.pexels.com/photos/2182980/pexels-photo-2182980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  })


  Vehicle.create!({
    owner: user4,
    name: "Sundance",
    address: "Creswick Road, Acton, London W3 9HF",
    berths: 6,
    description: "Very well equipped motorhome that will accommodate up to five people in comfort. The layout is well designed and incorporates permanent double bed (above cab), 2nd double bed (adapted from dining area), single bed, fitted kitchen and shower room.",
    price_per_night: 195,
    category: "Caravan",
    remote_photo_url: "https://images.unsplash.com/photo-1489307229055-9d55422662bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80",
  })

  Vehicle.create!({
    owner: user5,
    name: "Seacliff Caravan",
    address: "48 Hermon Hill, Wanstead, London E11 2AP",
    berths: 4,
    description: "You will love this caravan, it’s like new.....all mod cons, microwave, oven Hob, tv, fridge freezer, heaters & fly screens for hot summer nights, plenty of room in this 4/5 berth, a fixed double bed, with a light weight door, which give your own en-suite (loo & shower ) lots of storage also great for kids & a large pull out double at the front which can take 2 adults & a small child.",
    price_per_night: 200,
    category: "Caravan",
    remote_photo_url: "https://images.unsplash.com/photo-1546432924-bc5099ed38b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  })

  Vehicle.create!({
    owner: user1,
    name: "Seacliff",
    address: "31 Calverley Close, Bishops Stortford, Hertfordshire, CM23 4JJ",
    berths: 8,
    description: "You will love this caravan, it’s like new.....all mod cons, microwave, oven Hob, tv, fridge freezer, heaters & fly screens for hot summer nights, plenty of room in this 4/5 berth, a fixed double bed, with a light weight door, which give your own en-suite (loo & shower ) lots of storage also great for kids & a large pull out double at the front which can take 2 adults & a small child.",
    price_per_night: 165,
    category: "Caravan",
    remote_photo_url: "https://images.unsplash.com/photo-1515876305430-f06edab8282a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1500&q=80"
  })

  Vehicle.create!({
    owner: user2,
    name: "Folding Camper",
    address: "108 Hickory Close, Edmonton, London N9 7PZ",
    berths: 4,
    description: "We have created a cosy escape for anyone wanting modern luxury, with the traditional canvas camping feel. The Pennine Quartz is a lovely 5 birth folding camper that is everything you would expect from a five berth caravan including, An air heater for those chilly nights, Hot running water, gas grill and hob, firdge with small freezer.",
    price_per_night: 175,
    category: "Motorhome",
    remote_photo_url: "https://images.unsplash.com/photo-1520101244246-293f77ffc39e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  })

  Vehicle.create!({
    owner: user3,
    name: "TB3",
    address: "21 Crescent East, Hadley Wood, Barnet EN4 0EY",
    berths: 6,
    description: "Easy to set up can be done in 15 minutes six birth with Awning that can be used for extra births with possably blow up beds or just extra space",
    price_per_night: 240,
    category: "Trailer Tent",
    remote_photo_url: "https://images.unsplash.com/photo-1511701455363-d46ed8e3b728?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  })

  Vehicle.create!({
    owner: user4,
    name: "Connie Cherry",
    address: "438 Rush Green Road, Romford RM7 0LX",
    berths: 8,
    description: "Large trailer tent in really fine condition, stored inside during the winter period.,
Sleeps four (two double beds) above ground level with option to use awning for extra accommodation.
Impressive living area of around 190 square feet. Mesh windows to assist ventilation and keep out insects.
Built in storage lockers and drawers.Roof linings. Wardrobe/toilet compartment in awning. Kitchen unit comprising gas hob, grill and sink.",
    price_per_night: 235,
    category: "Trailer Tent",
    remote_photo_url: "https://images.unsplash.com/photo-1501722969499-fa2de05a9335?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2548&q=80"
  })

  Vehicle.create!({
    owner: user5,
    name: "Madge",
    address: "438 Rush Green Road, Romford RM7 0LX",
    berths: 8,
    description: "You will love this caravan, it’s like new.....all mod cons, microwave, oven Hob, tv, fridge freezer, heaters & fly screens for hot summer nights, plenty of room in this 4/5 berth, a fixed double bed, with a light weight door, which give your own en-suite (loo & shower ) lots of storage also great for kids & a large pull out double at the front which can take
2 adults & a small child.",
    price_per_night: 250,
    category: "Caravan",
    remote_photo_url: "https://images.unsplash.com/photo-1543395136-75b39bc00e0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  })

  Vehicle.create!({
    owner: user1,
    name: "Beatrice 'Bettie'",
    address: "1 Milton Avenue, Kingsbury, London NW9 0EU",
    berths: 6,
    description: "Meet Bettie, our glorious Camper Van. She is a Ford Transit, high top, long wheel base, manual drive van, keen for adventure and the open road! Having just undertaken a small 'makeover' as such, she is ready for the road for this spring/ summer. Perfect for holidays, weekend breaks, festivals, or even just a one night escape away from the normal rush of life. Betts is located in North London, where she can be collected easily, or arrangements can be made.",
    price_per_night: 210,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1548424891-b2f4e3b433d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1470&q=80"
  })

  Vehicle.create!({
    owner: user2,
    name: "Dakota'",
    address: "340 Preston Road, Harrow HA3 0QH",
    berths: 6,
    description: "Lovely original VW westy campervan. Dakota is a 78 VW Westfalia Berlin, Classic 70’s Dakota beige colour with original style plaid fabric. 2 gas burner cooker, fridge, rock n roll bed seating and large bed in the pop top. Plenty of storage cupboards and roof rack in front roof section.",
    price_per_night: 140,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1461435218581-ff0972867e90?ixlib=rb-1.2.1&auto=format&fit=crop&w=1506&q=80"
  })

  Vehicle.create!({
    owner: user3,
    name: "Tullulah",
    address: "133, Marks Road, Romford. RM7 7AF",
    berths: 2,
    description: "Tullulah is one of the greatest Defenders LandRover built with is famous 300TDI engines, finished in the heritage green. Fitted with a 5 speed manual gearbox with high and low range and diff lock for those who feel adventurous and taking to the rough stuff. She is set up for 4 campers, but seats 5. An additional RV tent is avaiable as an optional extra. There is space in the rear compartment for kit, room on the roof for bikes etc.",
    price_per_night: 170,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1464475355873-c68befb75ce9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
  })

  Vehicle.create!({
    owner: user4,
    name: "Barbra",
    address: "134/138 Clarence Road, London E5 8DY",
    berths: 2,
    description: "From beaches to campsites, from weddings to festivals - Barbra happily escort you and a buddy on any UK adventure! Lots of mod cons: cooker, sink, cool box, cold (rinse off) shower and even a playstation! And a cosy double bed to fold out at the end of the day – you can snuggle down in “Barbra’s belly” and recharge for the next day’s adventure!",
    price_per_night: 180,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1539346866065-8a03d906fcb0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
  })

  Vehicle.create!({
    owner: user5,
    name: "Gorgeous T6 Camper",
    address: "64 Queen Elizabeth's Walk, London N16 5UG",
    berths: 2,
    description: "We bought this van last year to go away with our two young children and it has been amazing fun so far! France last year, Spain this year, the van has proven it's worth as a great and comfortable way to get around, and an amazing little space to give those extra comforts when camping.",
    price_per_night: 200,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1543395136-75b39bc00e0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  })

  Vehicle.create!({
    owner: user1,
    name: "Jennifer",
    address: "4 Newnton Close, Stamford Hill, London N4 2RQ",
    berths: 6,
    description: "Hi fellow campers, my name is Jennifer and I’m a 1988 VW T25 Westfalia Joker Campervan. I am originally from Germany but have travelled all over Europe, in fact I’ve been to almost every country, even Athens! I now live in Surrey with my lovely family. I’m a 1.6 Turbo Diesal Water Cooled 4 berth Campervan. I come with a fridge (electric, gas, battery), Eberspacher heater, electrics, water and gas hob cooker. I’m all original down to the upholstery, paintwork and stickers.",
    price_per_night: 185,
    category: "Campervan",
    remote_photo_url: "https://images.unsplash.com/photo-1487588346406-4ca156e06c34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  })

 50.times do
  Booking.create!({
    renter: User.all.sample,
    vehicle: Vehicle.all.sample,
    start_date: Date.today + (1..100).to_a.sample,
    number_of_nights: (1..10).to_a.sample
  })
end

review_comments = ["Great campervan", "Had a wonderful time. Cant wait to use this vehicle again.", "Highly recommend this vehicle", "The caravan was not to my standards.", "Average stay", "Lovely quiet vehicle. Very friendly hosts too!", "Excellent vehicle I will recommend to my friends."]

 50.times{  Review.create!({
    booking:  Booking.all.sample,
    user: User.all.sample,
    rating: (1..5).to_a.sample,
    comment: review_comments.sample
  })
}
