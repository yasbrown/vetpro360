class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :gender
      t.float :weight, default: 0

      t.timestamps
    end
  end
end
