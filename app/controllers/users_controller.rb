class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @animal = Animal.find_by(user: @user.id)
  end
end
