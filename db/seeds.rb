# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Trip.delete_all
Trip.create(user_id: 1, trip_name: 'Japan May 2013')
Trip.create(user_id: 1, trip_name: 'France 2013')
Trip.create(user_id: 2, trip_name: 'Morocco')
Trip.create(user_id: 3, trip_name: 'Ski Trip 2013')

