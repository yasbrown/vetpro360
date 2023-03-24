class AddVetForeignKeysToMedicationsAndAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :medications, :vet, foreign_key: true
    add_reference :appointments, :vet, foreign_key: true
  end
end
