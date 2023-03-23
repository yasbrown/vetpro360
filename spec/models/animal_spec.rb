require 'rails_helper'

RSpec.describe Animal, type: :model do
  it "determines if animal is neutered" do
    animal = FactoryBot.create(:animal, gender: "male neutered")
    expect(animal).to be_is_neutered

    animal = FactoryBot.create(:animal, gender: "male")
    expect(animal).not_to be_is_neutered
  end
end
