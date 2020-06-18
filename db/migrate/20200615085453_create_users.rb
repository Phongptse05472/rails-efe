class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Email
      t.string :PhoneNumber
      t.integer :RollNumber
      t.integer :RoleID
      t.text :Avata
      t.string :Password
      t.boolean :IsActive

      t.timestamps
    end
  end
end
