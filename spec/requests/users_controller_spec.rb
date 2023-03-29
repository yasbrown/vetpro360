require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  let(:user) { create(:user) }

  it "returns a list of all users" do
    sign_in user
    get users_path
    expect(response).to render_template(:index)
    expect(response.body).to include("Joe Bloggs")
  end

  it "renders the user's show page" do
    sign_in user
    get user_path(user)
    expect(response).to render_template(:show)
    expect(response.body).to include("Email:")
  end
end
