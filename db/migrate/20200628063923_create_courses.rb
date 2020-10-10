class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :image
      t.text :description
      t.string :author
      t.boolean :is_free
      t.float :rate, default: 0
      t.boolean :is_active , default: true
      t.bigint :number_enrollment, default: 0
      t.float :duration, default: 0
      t.timestamps
    end
  end
end
