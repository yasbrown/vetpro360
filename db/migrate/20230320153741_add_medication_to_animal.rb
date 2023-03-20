class AddMedicationToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_reference :animals, :medication, foreign_key: true
  end
end
