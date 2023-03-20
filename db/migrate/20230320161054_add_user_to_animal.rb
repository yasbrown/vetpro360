class AddUserToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_reference :animals, :user, foreign_key: true
  end
end
