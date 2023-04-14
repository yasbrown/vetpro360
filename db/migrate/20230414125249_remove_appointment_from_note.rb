class RemoveAppointmentFromNote < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :appointment_id
  end
end
