class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.datetime :datetime_note_created
      t.text :content
      t.references :animal, null: false, foreign_key: true
      t.references :vet_attribute, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
