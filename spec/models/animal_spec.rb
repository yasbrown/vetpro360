require 'rails_helper'

RSpec.describe Animal, type: :model do
  it "has a name" do
    animal = FactoryBot.create(:animal)
    expect(animal).to be_valid

    animal.name = ""
    expect(animal).not_to be_valid
  end

  it "has a species" do
    animal = FactoryBot.create(:animal)
    expect(animal).to be_valid

    animal.species = ""
    expect(animal).not_to be_valid
  end

  it "has a gender" do
    animal = FactoryBot.create(:animal)
    expect(animal).to be_valid

    animal.gender = ""
    expect(animal).not_to be_valid
  end

  it "has a numerical weight" do
    animal = FactoryBot.create(:animal, weight: 10)
    expect(animal.weight).to be_a(Integer)
  end

  it "determines if animal is neutered" do
    animal = FactoryBot.create(:animal)
    expect(animal).to be_is_neutered

    animal.gender = "male"
    expect(animal).not_to be_is_neutered
  end
end
