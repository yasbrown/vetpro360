FactoryBot.define do
  # sequence :email do |n|
  #   "person#{n}@example.com"
  # end

  factory :user do
    first_name { "Joe" }
    last_name { "Bloggs" }
    email { "person#{Time.now.to_f}@example.com" }
    password { "password" }
  end
end
