require 'rails_helper'

RSpec.describe Vet, type: :model do
  it "has a name" do
    vet = FactoryBot.create(:vet)
    expect(vet).to be_valid

    vet.name = ""
    expect(vet).not_to be_valid
  end
end
