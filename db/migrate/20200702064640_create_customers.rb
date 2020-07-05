class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.integer :role_id
      t.string :name
      t.string :phone_number
      t.integer :roll_number
      t.boolean :is_active

      t.timestamps
    end
  end
end
