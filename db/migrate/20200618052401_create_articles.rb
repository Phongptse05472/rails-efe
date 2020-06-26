class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :course_id
      t.text :description
      t.string :tag
      t.time :duration
      t.integer :number_complete
      t.boolean :is_free
      t.text :link_file_attach

      t.timestamps
    end
  end
end
