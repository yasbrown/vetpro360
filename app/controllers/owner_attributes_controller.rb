class OwnerAttributesController < ApplicationController
  before_action :set_owner, only: [:edit, :update]
  # before_action :set_user, only: [:create]

  def index
    @owners = OwnerAttribute.all
  end

  def show
    @owner = OwnerAttribute.find(params[:id])

    @animals = Animal.where(owner_attribute: @owner.id, archived: false)
    @archived_animals = Animal.where(owner_attribute: @owner.id, archived: true)
  end

  def new
    @owner = OwnerAttribute.new
  end

  def create
    new_user = User.create!
    new_user.is_owner = true
    new_user.save!
    @owner = OwnerAttribute.new(owner_params)
    @owner.user = new_user
    @owner.save!
    redirect_to owner_attribute_path(@owner)
  end

  def edit
  end

  def update
    @owner.update(owner_params)
    redirect_to owner_attribute_path(@owner)
  end

  private

  def owner_params
    params.require(:owner_attribute).permit(:first_name, :last_name, :address, :phone_number)
  end

  def set_owner
    @owner = OwnerAttribute.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
