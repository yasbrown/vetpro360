require 'ice_cube'

puts "Deleting all Users"
User.destroy_all
puts "Deleting all Vets"
Vet.destroy_all
puts "Deleting all Animals"
Animal.destroy_all
puts "Deleting all Slots"
Appointment.destroy_all
puts "Deleting all Appointments"
Slot.destroy_all
puts "DB clean"

puts "Building new users"

user = User.create!(
  first_name: "Jane",
  last_name: "Doe",
  email: "test@test.com",
  password: "password",
  address: "4 Hoyte Drive, London"
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

vet = Vet.create!(
  name: "Will"
)
puts "Vet with id: #{vet.id} has been created"

nurse = Vet.create!(
  name: "Nurse"
)
puts "Vet with id: #{nurse.id} has been created"


boolean_array = [true, false]
counter = 0
ailment = ["Sore leg", "Skin", "Ears", "Diarrhoea", "Not right", "Vaccines"]

schedule = IceCube::Schedule.new(Time.local(2023, 3, 24, 9)) do |s|
  s.add_recurrence_rule(IceCube::Rule.minutely(15).count(37))
end

schedule.all_occurrences[0..-2].each do |starting_time_slots|
  slot = Slot.create!(
    date: Date.new(2023, 3, 24),
    available: boolean_array.sample,
    start_time: starting_time_slots,
    end_time: schedule.all_occurrences[counter += 1]
  )
  puts "Slot with id: #{slot.id} has been created"

  if slot.available == false
    appointment = Appointment.create!(
      animal: pet1,
      slot: slot,
      start_time: slot.start_time,
      end_time: slot.end_time,
      reason_for_appointment: ailment.sample,
      vet: vet
    )
    puts "Appointment with id: #{appointment.id} has been created"
  end
end

puts "Finished!"
