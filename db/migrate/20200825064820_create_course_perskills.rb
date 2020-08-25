class CreateCoursePerskills < ActiveRecord::Migration[6.0]
  def change
    create_table :course_perskills do |t|
      t.string :int
      t.belongs_to :course
      t.belongs_to :skill
      t.timestamps
    end
  end
end
