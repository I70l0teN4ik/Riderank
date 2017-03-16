# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'foo', email: 'foo@bar.com', password: 'bar')

uber = Taxi.create(name: 'Uber')
mpt = Taxi.create(name: 'MPT')
sava = Taxi.create(name: 'Sawa')

now = DateTime.current

Ride.create([
   { user_id: user.id, taxi_id: uber.id, origin: '1', destination: '2', distance: 4455, price: 6.25, created_at: now },
   { user_id: user.id, taxi_id: mpt.id,  origin: '1', destination: '2', distance: 2828, price: 3.25, created_at: now.beginning_of_day + 1.hour },
   { user_id: user.id, taxi_id: uber.id, origin: '1', destination: '2', distance: 5000, price: 7.30, created_at: now.beginning_of_day - 1.day },
   { user_id: user.id, taxi_id: sava.id, origin: '1', destination: '2', distance: 10000, price: 12.5, created_at: now.beginning_of_week - 1.day },
   { user_id: user.id, taxi_id: mpt.id, origin: '1', destination: '2', distance: 123456, price: 123.45, created_at: now.beginning_of_month - 1.week },
])