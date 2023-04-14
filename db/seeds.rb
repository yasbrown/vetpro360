require 'ice_cube'

puts "Deleting all Users"
User.destroy_all
puts "Deleting all Owners"
OwnerAttribute.destroy_all
puts "Deleting all Vets"
VetAttribute.destroy_all
puts "Deleting all Animals"
Animal.destroy_all
puts "Deleting all Slots"
Appointment.destroy_all
puts "Deleting all Appointments"
Slot.destroy_all
puts "DB clean"

puts "Building new users"

user1 = User.create!(
  email: "test1@test.com",
  password: "password",
  is_owner: true
)
puts "User with id: #{user1.id} has been created"

user2 = User.create!(
  email: "test2@test.com",
  password: "password",
)
puts "User with id: #{user2.id} has been created"

owner = OwnerAttribute.create!(
  first_name: "Jane",
  last_name: "Doe",
  address: "4 Hoyte Drive, London",
  phone_number: "0779876002",
  user: user1
)
puts "Owner with id: #{owner.id} has been created"

pet1 = Animal.create!(
  name: "Fido",
  species: "Dog",
  gender: "Male Neutered",
  owner_attribute: owner
)
puts "Animal with id: #{pet1.id} has been created"

pet2 = Animal.create!(
  name: "Luna",
  species: "Dog",
  gender: "Female Neutered",
  owner_attribute: owner,
  archived: true
)
puts "Animal with id: #{pet2.id} has been created"

pet3 = Animal.create!(
  name: "Coco",
  species: "Dog",
  gender: "Female Neutered",
  owner_attribute: owner,
  current_weight: 15
)
puts "Animal with id: #{pet3.id} has been created"

vet = VetAttribute.create!(
  name: "Will",
  user: user2
)
puts "Vet with id: #{vet.id} has been created"

# nurse = Vet.create!(
#   name: "Nurse"
# )
# puts "Vet with id: #{nurse.id} has been created"


boolean_array = [true, false]
counter = 0
ailment = ["Sore leg", "Skin", "Ears", "Diarrhoea", "Not right", "Vaccines"]
pets = [pet1, pet2, pet3]

schedule = IceCube::Schedule.new(Time.local(2023, 4, 14, 9)) do |s|
  s.add_recurrence_rule(IceCube::Rule.minutely(15).count(37))
end

schedule.all_occurrences[0..-2].each do |starting_time_slots|
  slot = Slot.create!(
    date: Date.new(2023, 4, 14),
    available: boolean_array.sample,
    start_time: starting_time_slots,
    end_time: schedule.all_occurrences[counter += 1]
  )
  puts "Slot with id: #{slot.id} has been created"

  if slot.available == false
    appointment = Appointment.create!(
      animal: pets.sample,
      slot: slot,
      start_time: slot.start_time,
      end_time: slot.end_time,
      reason_for_appointment: ailment.sample,
      vet_attribute: vet
    )
    puts "Appointment with id: #{appointment.id} has been created"
  end
end

puts "Finished!"
