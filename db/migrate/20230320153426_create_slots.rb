class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
