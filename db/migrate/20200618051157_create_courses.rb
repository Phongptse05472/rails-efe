class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :courseName
      t.text :courseImage
      t.text :description
      t.integer :rating
      t.boolean :isFree

      t.timestamps
    end
  end
end
