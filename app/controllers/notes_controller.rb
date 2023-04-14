class NotesController < ApplicationController
  before_action :set_animal, only: [:create]

  def create
    @new_note = Note.new(notes_params)
    @new_note.animal = @animal
    @new_note.vet_attribute = VetAttribute.find_by(user_id: current_user.id)
    @new_note.save!
    redirect_to history_animal_path(@animal)
  end

  private

  def notes_params
    params.require(:note).permit(:content, :datetime_note_created)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
