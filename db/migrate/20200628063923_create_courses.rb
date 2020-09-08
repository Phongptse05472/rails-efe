class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :image
      t.text :description
      t.string :author
      t.boolean :is_free
      t.float :rate
      t.boolean :is_active , default: true
      t.bigint :number_enrollment
      t.float :duration
      t.timestamps
    end
  end
end
