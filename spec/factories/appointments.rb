FactoryBot.define do
  factory :appointment do
    start_time { Time.local(2023, 3, 24, 9) }
    end_time { Time.local(2023, 3, 24, 10) }
    animal
    vet
    slot
  end
end
