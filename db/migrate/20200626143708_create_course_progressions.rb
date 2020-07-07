class CreateCourseProgressions < ActiveRecord::Migration[6.0]
  def change
    create_table :course_progressions do |t|
      t.belongs_to :course
      t.belongs_to :customer
      t.integer :customer_id
      t.integer :course_id
      t.float :progression
      t.integer :current_article_id
      t.time :updated_time

      t.timestamps
    end
  end
end
