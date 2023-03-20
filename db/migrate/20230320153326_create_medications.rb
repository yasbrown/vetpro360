class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :frequency_to_give_per_day
      t.integer :quantity_dispensed

      t.timestamps
    end
  end
end
