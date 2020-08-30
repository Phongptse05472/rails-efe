class CreateArticleLos < ActiveRecord::Migration[6.0]
  def change
    create_table :article_los do |t|
      t.belongs_to :article, optional: true
      t.belongs_to :lo, optional: true
      t.timestamps
    end
  end
end
