class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.references :customer, index: true, foreign_keys: true
      t.references :role, index: true, foreign_keys: true
      t.string :name
      t.timestamps
    end
  end
end
