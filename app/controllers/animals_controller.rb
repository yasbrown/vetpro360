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

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to user_path(animal.user), status: :see_other
  end

  def archive_animal
    animal = Animal.find(params[:animal_id])
    animal.archived = true
    animal.save
    redirect_to user_path(animal.user), status: :see_other
  end

  def unarchive_animal
    animal = Animal.find(params[:animal_id])
    animal.archived = false
    animal.save
    redirect_to user_path(animal.user), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def animal_params
    params.require(:animal).permit(:name, :species, :gender)
  end
end