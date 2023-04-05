class RemoveVetForeignKeysFromAppointmentAndMedication < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :vet_attribute, foreign_key: true
    remove_column :appointments, :vet_id
    add_reference :medications, :vet_attribute, foreign_key: true
    remove_column :medications, :vet_id
  end
end
