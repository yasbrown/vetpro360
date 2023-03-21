class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @animals = Animal.where(user: @user.id)
  end
end
