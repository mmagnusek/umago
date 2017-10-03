# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

if Rails.env == 'production'
  User.create(email: 'admin@umago.cz', password: 'sCPQeoWsCP')
else
  %w(
    apleskac@blueberryapps.com
    mmagnusek@blueberryapps.com
  ).each do |email|
    User.create(email: email, password: 'heslo123')
  end
end


Reservation.delete_all

reservations = [
  {"date_from"=>"01-01-2016", "date_to"=>"01-01-2016", "name"=>"Ruzicka",  "email"=>"asd@asdasc.cz", "notice"=>"Seed 1"},
  {"date_from"=>"01-02-2016", "date_to"=>"10-02-2016", "name"=>"Cervinka", "email"=>"asd@asdasc.cz", "notice"=>"Seed 2"},
  {"date_from"=>"10-02-2016", "date_to"=>"15-02-2016", "name"=>"Cervinka", "email"=>"asd@asdasc.cz", "notice"=>"Seed 2"},
  {"date_from"=>"01-03-2016", "date_to"=>"08-03-2016", "name"=>"Postolka", "email"=>"asd@asdasc.cz", "notice"=>"Seed 3"},
  {"date_from"=>"01-04-2016", "date_to"=>"11-04-2016", "name"=>"Kolicka",  "email"=>"asd@asdasc.cz", "notice"=>"Seed 5"}
  ]

reservations.each do |reservation|
  Reservation.create reservation
end
