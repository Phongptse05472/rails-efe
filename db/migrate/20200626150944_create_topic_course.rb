class CreateTopicCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_courses do |t|
      t.belongs_to :course
      t.belongs_to :article
    end
  end
end
