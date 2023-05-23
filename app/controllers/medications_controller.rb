class MedicationsController < ApplicationController
  before_action :set_vet, only: [:create]
  before_action :set_animal, only: [:create]

  def create
    @medication = Medication.new(medication_params)
    @medication.vet_attribute = @vet
    @medication.animal = @animal
    @medication.save!
    redirect_to history_animal_path(@animal)
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :start_date, :end_date, :quantity_dispensed, :frequency_to_give_per_day)
  end

  def set_vet
    @vet = VetAttribute.find_by(user_id: current_user.id)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
