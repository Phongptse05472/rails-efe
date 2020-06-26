class CreateArticleProgressions < ActiveRecord::Migration[6.0]
  def change
    create_table :article_progressions do |t|
      t.belongs_to :article, :user_info
      t.integer :user_id
      t.integer :article_id
      t.time :time_point
      t.boolean :is_viewed
      t.time :updated_time

      t.timestamps
    end
  end
end
