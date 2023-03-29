require 'rails_helper'

RSpec.describe "AnimalsControllers", type: :request do
  let(:user) { create(:user) }
  let(:animal) { create(:animal) }

  it "renders the animal's show page" do
    sign_in user
    get animal_path(animal)
    expect(response).to render_template(:show)
    expect(response.body).to include("Coco")
  end

  it "archives an animal and redirects to the User's show page" do
    sign_in user
    get "/animals/:animal_id/archive_animal"
    expect(response).to redirect_to(assigns(:animal))
    follow_redirect!
    expect(response.body).to include("Unarchive animal")
  end
end
