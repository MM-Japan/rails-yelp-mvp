# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "destroying data..."
Restaurant.destroy_all
Review.destroy_all

puts "seeding..."
10.times do
  @restaurant = Restaurant.new({
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.phone_number
  })

  3.times do
    Review.create!({
      content: Faker::Lorem.paragraph,
      rating: rand(0..5),
      restaurant: @restaurant
    })
  end
end


puts "...done!"
