class AddAnimalToMedication < ActiveRecord::Migration[7.0]
  def change
    add_reference :medications, :animal, foreign_key: true
  end
end
