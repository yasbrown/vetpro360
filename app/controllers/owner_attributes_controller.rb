class OwnerAttributesController < ApplicationController
  def index
    @owners = OwnerAttribute.all
  end

  def show
    @owner = OwnerAttribute.find(params[:id])

    @animals = Animal.where(owner_attribute: @owner.id, archived: false)
    @archived_animals = Animal.where(owner_attribute: @owner.id, archived: true)
  end
end
