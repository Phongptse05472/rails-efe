class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :CourseID
      t.string :ArticleTitle
      t.text :Description
      t.string :Tag
      t.time :Duration
      t.integer :NumberComplete
      t.boolean :IsFree
      t.text :LinkFileAttach

      t.timestamps
    end
  end
end
