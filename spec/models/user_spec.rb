require 'rails_helper'

RSpec.describe User, type: :model do
  it "has an email" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid

    user.email = ""
    expect(user).not_to be_valid
  end

  it "has a password" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid

    user.password = "1234"
    expect(user).not_to be_valid
  end

  it "has a password of 8 characters or more" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid

    user.password = user.password.chop
    expect(user).not_to be_valid
  end

  it "has a first name" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid

    user.first_name = ""
    expect(user).not_to be_valid
  end

  it "has a last name" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid

    user.last_name = ""
    expect(user).not_to be_valid
  end
end
