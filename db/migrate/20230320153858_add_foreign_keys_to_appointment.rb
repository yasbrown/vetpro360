class AddForeignKeysToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :animal, foreign_key: true
    add_reference :appointments, :user, foreign_key: true
    add_reference :appointments, :slot, foreign_key: true
  end
end
