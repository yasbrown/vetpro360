# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# *-- BUILDING INSTANCES --*

puts "Deleting all Users"
User.destroy_all
puts "Deleting all Animals"
Animal.destroy_all
puts "Deleting all Slots"
Slot.destroy_all
puts "DB clean"

puts "Building new users"

user = User.create!(
  first_name: "Jane",
  last_name: "Doe",
  email: "test@test.com",
  password: "password",
  address: "4 Hoyte Drive, London",
  owner: true
)
puts "User with id: #{user.id} has been created"

pet1 = Animal.create!(
  name: "Fido",
  species: "Dog",
  gender: "Male Neutered",
  user: user
)
puts "Animal with id: #{pet1.id} has been created"

pet2 = Animal.create!(
  name: "Luna",
  species: "Dog",
  gender: "Female Neutered",
  user: user,
  archived: true
)
puts "Animal with id: #{pet2.id} has been created"

boolean_array = [true, false]
36.times do
  slot = Slot.create!(
    date: Date.new(2023, 3, 20),
    available: boolean_array.sample,
    start_time: Time.new(2023, 3, 20, 9),
    end_time: Time.new(2023, 3, 20, 18)
  )
  puts "Slot with id: #{slot.id} has been created"
end


puts "Finished!"
