class MedicationsController < ApplicationController
  before_action :set_vet, only: [:create]
  before_action :set_animal, only: [:create]

  def create
    @medication = Medication.new(medication_params)
    @medication.vet_attribute = @vet
    @medication.save!
    redirect_to history_animal_path(@animal)
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :start_date, :end_date)
  end

  def set_vet
    @vet = VetAttribute.find(params[:vet_attribute_id])
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
