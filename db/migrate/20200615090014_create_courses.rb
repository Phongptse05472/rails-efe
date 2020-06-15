class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :CourseName
      t.text :CourseImage
      t.text :CourseDescription
      t.integer :Rating
      t.integer :NumberEnrollment
      t.boolean :IsFree

      t.timestamps
    end
  end
end
