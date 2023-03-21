class AnimalsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @animal = Animal.new
  end

  def create

  end
end
