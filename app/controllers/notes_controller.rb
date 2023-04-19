class NotesController < ApplicationController
  before_action :set_animal, only: [:create]
  before_action :set_note, only: [:edit, :update]

  def create
    @new_note = Note.new(notes_params)
    @new_note.animal = @animal
    @new_note.vet_attribute = VetAttribute.find_by(user_id: current_user.id)
    @new_note.datetime_note_created = Time.now
    @new_note.save!
    redirect_to history_animal_path(@animal)
  end

  def edit
    @animal = @note.animal
  end

  def update
    @note.update(notes_params)
    redirect_to history_animal_path(@note.animal)
  end

  private

  def notes_params
    params.require(:note).permit(:content, :datetime_note_created)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
