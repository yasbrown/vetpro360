require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "has a start time" do
    appointment = FactoryBot.create(:appointment)
    expect(appointment).to be_valid

    appointment.start_time = ""
    expect(appointment).not_to be_valid
  end

  it "has an end time" do
    appointment = FactoryBot.create(:appointment)
    expect(appointment).to be_valid

    appointment.end_time = ""
    expect(appointment).not_to be_valid
  end
end
