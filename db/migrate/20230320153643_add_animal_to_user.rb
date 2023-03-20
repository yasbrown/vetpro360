class AddAnimalToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :animal, foreign_key: true
  end
end
