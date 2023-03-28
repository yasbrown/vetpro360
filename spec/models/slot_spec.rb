require 'rails_helper'

RSpec.describe Slot, type: :model do
  it "has a date" do
    slot = FactoryBot.create(:slot)
    expect(slot).to be_valid

    slot.date = ""
    expect(slot).not_to be_valid
  end

  it "has a start time" do
    slot = FactoryBot.create(:slot)
    expect(slot).to be_valid

    slot.start_time = ""
    expect(slot).not_to be_valid
  end

  it "has an end time" do
    slot = FactoryBot.create(:slot)
    expect(slot).to be_valid

    slot.end_time = ""
    expect(slot).not_to be_valid
  end
end
