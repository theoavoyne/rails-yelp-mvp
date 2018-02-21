# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning database.."
Restaurant.destroy_all
Review.destroy_all

puts "generating false restaurants.."

5.times {
  restaurant = Restaurant.new
  restaurant.name = Faker::Company.name
  restaurant.address = Faker::Address.street_address
  restaurant.phone_number = Faker::PhoneNumber.cell_phone
  restaurant.category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  restaurant.save!

  3.times {
    review = Review.new
    review.rating = (0..5).to_a.sample
    review.content = Faker::Lorem.sentence
    review.restaurant = restaurant
    review.save!
  }
}

puts "done"
