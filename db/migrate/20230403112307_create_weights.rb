class CreateWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :weights do |t|
      t.date :date_weight_updated
      t.float :weight, default: 0.0
      t.references :animal, foreign_key: true


      t.timestamps
    end
  end
end
