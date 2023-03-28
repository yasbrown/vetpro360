FactoryBot.define do
  factory :user do
    first_name { "Joe" }
    last_name { "Bloggs" }
    sequence(:email) { |n| "jb#{n}@aol.com" }
    password { "password" }
  end
end
