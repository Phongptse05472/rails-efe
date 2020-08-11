class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.time :duration
      t.bigint :view_number
      t.boolean :is_free
      t.text :link_file_attach
      t.text :video
      t.timestamps
    end
  end
end
