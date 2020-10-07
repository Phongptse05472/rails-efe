class AddDateCreatedToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :date_created, :date
  end
end
