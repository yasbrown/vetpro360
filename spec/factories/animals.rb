FactoryBot.define do
  factory :animal do
    name { "Coco" }
    species { "Dog" }
    gender { "male neutered" }
    user
  end
end
