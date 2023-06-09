class AnimalsController < ApplicationController
  before_action :set_owner, only: [:new, :create]
  before_action :set_animal, only: [:destroy, :show, :edit, :update, :history]

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.owner_attribute = @owner
    @animal.save!
    redirect_to owner_attribute_path(@owner)
  end

  def destroy
    @animal.destroy
    redirect_to owner_attribute_path(@animal.owner_attribute), status: :see_other
  end

  def archive_animal
    animal = Animal.find(params[:animal_id])
    animal.archived = true
    animal.save!
    redirect_to owner_attribute_path(animal.owner_attribute), status: :see_other
  end

  def unarchive_animal
    animal = Animal.find(params[:animal_id])
    animal.archived = false
    animal.save!
    redirect_to owner_attribute_path(animal.owner_attribute), status: :see_other
  end

  def show
    @owner = @animal.owner_attribute
    @appointments = Appointment.where(animal_id: Animal.find(params[:id]))
    @new_weight = Weight.new

    @active_medications_array = []
    medications = Medication.where(animal_id: Animal.find(params[:id]))
    medications.each do |current_medication|
      @active_medications_array << current_medication if !current_medication.medication_course_completed?
    end

    @all_medications = Medication.where(animal_id: Animal.find(params[:id])).sort_by {|medication| medication.created_at}
  end

  def edit
  end

  def update
    @animal.update(animal_params)
    redirect_to animal_path(@animal)
  end

  def history
    @active_medications_array = []
    current_meds = Medication.where(animal_id: params[:id])
    current_meds.each do |current_med|
      @active_medications_array << current_med if !current_med.medication_course_completed?
    end

    @new_note = Note.new
    @all_notes = Note.where(animal_id: params[:id]).sort_by {|note| note.created_at}.reverse
    @all_medications = Medication.where(animal_id: params[:id])
    @medication = Medication.new
    @new_weight = Weight.new
  end


  private

  def set_owner
    @owner = OwnerAttribute.find(params[:owner_attribute_id])
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :species, :breed, :gender, :weight)
  end
end
