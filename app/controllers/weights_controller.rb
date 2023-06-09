class WeightsController < ApplicationController
  before_action :set_animal, only: [:create]

  def create
    @new_weight = Weight.new(weight_params)
    @new_weight.animal = @animal
    @animal.current_weight = @new_weight.weight
    @new_weight.save!
    @animal.save!
    # if pressing save from history redirect to history page. if pressing save from animal show page redirect back to show page
    redirect_to animal_path(@animal)
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def weight_params
    params.require(:weight).permit(:weight, :date_weight_updated)
  end
end
