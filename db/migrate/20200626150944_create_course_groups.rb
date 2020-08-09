class CreateCourseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :course_groups do |t|
      t.belongs_to :group
      t.belongs_to :course
      t.timestamps
    end
  end
end