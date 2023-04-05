class OwnerAttributesController < ApplicationController
  def index
    @owners = OwnerAttribute.all
  end

  def show
    @owner = OwnerAttribute.find(params[:id])

    @animals = Animal.where(user: @user.id, archived: false)
    @archived_animals = Animal.where(user: @user.id, archived: true)
  end
end
