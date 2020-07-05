class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :article, :customer
      # t.integer :customer_id
      # t.integer :article_id
      t.text :content
      t.integer :parent_id
      t.datetime :time_comment

      t.timestamps
    end
  end
end
