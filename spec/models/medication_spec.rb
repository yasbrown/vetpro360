require 'rails_helper'

RSpec.describe Medication, type: :model do
  it "has a quantity dispensed" do
    medication = FactoryBot.create(:medication)
    expect(medication).to be_valid

    medication.quantity_dispensed = ""
    expect(medication).not_to be_valid
  end

  it "quantity dispensed is a numerical value" do
    medication = FactoryBot.create(:medication)
    expect(medication.quantity_dispensed).to be_a(Integer)
  end

  it "has a start date" do
    medication = FactoryBot.create(:medication)
    expect(medication).to be_valid

    medication.start_date = ""
    expect(medication).not_to be_valid
  end

  it "has an end date" do
    medication = FactoryBot.create(:medication)
    expect(medication).to be_valid

    medication.end_date = ""
    expect(medication).not_to be_valid
  end

  it "frequency to give medication per day is a numerical value" do
    medication = FactoryBot.create(:medication)
    expect(medication.frequency_to_give_per_day).to be_an(Integer)
  end
end
