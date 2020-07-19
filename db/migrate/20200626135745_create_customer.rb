class CreateCustomer < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.belongs_to :user
      t.string :role_id
      t.string :name
      t.string :phone_number
      t.integer :roll_number
      t.boolean :is_active

      t.timestamps
    end
  end
end
