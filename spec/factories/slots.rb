FactoryBot.define do
  factory :slot do
    date { Time.local(2023, 3, 28) }
    start_time { Time.local(2023, 3, 28, 9) }
    end_time { Time.local(2023, 3, 28, 10) }
  end
end
