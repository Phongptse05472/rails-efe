class CreateCoursePreskills < ActiveRecord::Migration[6.0]
  def change
    create_table :course_preskills do |t|
      t.belongs_to :course
      t.belongs_to :skill
      t.integer :level_id

      t.timestamps
    end
  end
end
