class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :image
      t.text :description
      t.boolean :is_free
      t.float :rate , limit: 1
      t.integer :number_enrollment, limit: 2
      t.timestamps
    end
  end
end
