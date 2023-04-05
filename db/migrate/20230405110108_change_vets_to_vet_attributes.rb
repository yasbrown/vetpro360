class ChangeVetsToVetAttributes < ActiveRecord::Migration[7.0]
  def change
    rename_table :vets, :vet_attributes
    add_reference :vet_attributes, :user, foreign_key: true
  end
end
