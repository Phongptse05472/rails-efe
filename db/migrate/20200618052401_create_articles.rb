class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :articleTitle
      t.text :description
      t.string :tag
      t.time :duration
      t.integer :numberComplete
      t.boolean :isFree
      t.text :linkFileAttach
      t.timestamps
    end
  end
end
