# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.delete_all
Airport.delete_all

airport_codes = ['NYC', 'DFW', 'MEM', 'JFK', 'BOS', 'LAX', 'AUS']
airports = []
airport_codes.each do |code|
  airports << Airport.create(text_code: code)
end

12.times do |i|
  two_airports = airports.sample(2)
  Flight.create(
    takeoff: rand(5.months).seconds.from_now,
    duration_seconds: rand(2500..15000),
    departing_airport: two_airports[0],
    arriving_airport: two_airports[1]
  )
end
