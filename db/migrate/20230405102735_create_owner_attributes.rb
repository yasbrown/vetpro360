class CreateOwnerAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :owner_attributes do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :phone_number
      t.references :user

      t.timestamps
    end
  end
end
