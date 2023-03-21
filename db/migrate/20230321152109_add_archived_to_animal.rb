class AddArchivedToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :archived, :boolean, default: false
  end
end
