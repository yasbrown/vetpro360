class RemoveStartAndEndTimeForSlotsAndAppointmentsAddColumnsAsDatetimeColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :slots, :start_time
    remove_column :slots, :end_time
    remove_column :appointments, :start_time
    remove_column :appointments, :end_time

    add_column :slots, :start_time, :datetime
    add_column :slots, :end_time, :datetime
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
  end
end
