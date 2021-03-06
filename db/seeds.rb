# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['number_of_guest'] = rand(1..6)
    listing['number_of_rooms'] = rand(1..5)
    listing['number_of_bathrooms'] = rand(1..4)

    listing['country'] = Faker::Address.country
    listing['city'] = Faker::Address.city
    listing['area'] = Faker::Address.community
    listing['street'] = Faker::Address.street_address

    listing['price'] = rand(80..500)

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
