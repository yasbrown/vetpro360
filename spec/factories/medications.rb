FactoryBot.define do
  factory :medication do
    name { "Synulox" }
    quantity_dispensed { 14 }
    frequency_to_give_per_day { 2 }
    start_date { Time.local(2023, 3, 28) }
    end_date { Time.local(2023, 4, 4) }
    animal
    vet
  end
end
