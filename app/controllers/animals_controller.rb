class AnimalsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = @user
    @animal.save
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def animal_params
    params.require(:animal).permit(:name, :species, :gender)
  end
end
