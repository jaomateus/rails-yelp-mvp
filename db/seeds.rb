# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Deleting restaurants ands reviews...'
Restaurant.delete_all

puts 'Creating restaurants...'
CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  restaurant_name = Faker::Restaurant.name

  Restaurant.create ({
    name: restaurant_name ,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    category: CATEGORIES.sample
  }
  )

  puts "Created restaurant #{restaurant_name} "
  
  restaurant_id = Restaurant.last.id
  puts restaurant_id
  puts "Creating reviews for restaurant #{restaurant_name}"

  5.times do
    Review.create ({
      restaurant_id: restaurant_id,
      content: Faker::Restaurant.review,
      rating: [0..5].sample
    }
    )
  end
end

