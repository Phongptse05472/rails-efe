class CreateArticleSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :article_skills do |t|
      t.belongs_to :article
      t.belongs_to :skill
      t.belongs_to :level
      t.timestamps
    end
  end
end