class AddReasonForAppointmentToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :reason_for_appointment, :text
  end
end
