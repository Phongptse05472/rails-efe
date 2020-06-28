class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :link_article
      t.string :tag
      t.time :duration
      t.integer :number_complete

      t.timestamps
    end
  end
end
