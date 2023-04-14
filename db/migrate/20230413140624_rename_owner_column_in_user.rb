class RenameOwnerColumnInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :owner?, :is_owner
    change_column :users, :is_owner, :boolean, default: false
  end
end
