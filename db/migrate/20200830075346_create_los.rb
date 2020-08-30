class CreateLos < ActiveRecord::Migration[6.0]
  def change
    create_table :los do |t|
      t.string :name
      t.belongs_to :skill , optional: true
      t.timestamps
    end
  end
end
