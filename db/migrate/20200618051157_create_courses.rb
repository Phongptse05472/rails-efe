class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.belongs_to :customer
      t.string :name
      t.text :image
      t.text :description
      t.integer :rating
      t.boolean :is_free

      t.timestamps
    end
  end
end
