class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :animals, :weight, :current_weight
  end
end
