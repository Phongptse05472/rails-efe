class CreateCourseArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :course_articles do |t|
      t.belongs_to :course, index: true, foreign_keys: true
      t.belongs_to :article , index: true, foreign_keys: true
      t.integer :course_id
      t.integer :article_id
      t.timestamps
    end
  end
end
