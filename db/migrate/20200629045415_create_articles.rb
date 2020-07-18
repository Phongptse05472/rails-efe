class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :description
      t.text :link_article
      t.string :tag
      t.time :duration
      t.integer :number_complete
      t.integer :view_number
      t.boolean :is_free
      t.boolean :is_favor
      t.boolean :is_owner
      t.text :link_file_attach

      t.timestamps
    end
  end
end
