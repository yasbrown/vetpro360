class AddOwnerAttributeToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_reference :animals, :owner_attribute, foreign_key: true
  end
end
