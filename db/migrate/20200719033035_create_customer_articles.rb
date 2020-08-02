class CreateCustomerArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_articles do |t|
      t.belongs_to :customer
      t.belongs_to :article
      t.boolean :is_owner
      t.time :time_point
      t.boolean :is_viewed
      t.boolean :is_favor
      t.timestamps
    end
  end
end
