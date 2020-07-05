class CreateTopicCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_courses do |t|
      t.belongs_to :topic
      t.belongs_to :course
      # t.integer :topic_id
      # t.integer :course_id
      t.timestamps null: false
    end
  end
end