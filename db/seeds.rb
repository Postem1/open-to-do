# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Users
5.times do
  user = User.create(
        email:  Faker::Internet.email,
        name:   Faker::Name.first_name,
        password: 'password'
)
end
users = User.all

# Create Lists
10.times do
  list = List.create(
        title:  Faker::Lorem.sentence,
        permissions: ["open", "viewable", "private"].sample,
        user: users.sample
)
end
lists = List.all

# Create Items
15.times do
  item = Item.create(
        item_name:  Faker::Lorem.sentence,
        status: ["complete", "incomplete"].sample,
        list: lists.sample
)
end
items = Item.all

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
