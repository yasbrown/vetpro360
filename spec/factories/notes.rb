FactoryBot.define do
  factory :note do
    datetime_note_created { "2023-04-13 15:35:02" }
    content { "MyText" }
    animal { nil }
    vet_attribute { nil }
    appointment { nil }
  end
end
