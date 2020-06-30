class CreateCourseArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :course_articles do |t|
      t.belongs_to :course
      t.belongs_to :article
      t.integer :course_id
      t.integer :article_id
      t.timestamps
    end
  end
end
