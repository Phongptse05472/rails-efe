class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.belongs_to :user
      t.string :role_id
      t.string :name
      t.string :phone_number
      t.integer :roll_number
      t.text :avata
      t.boolean :is_active

      t.timestamps
    end
  end
end
