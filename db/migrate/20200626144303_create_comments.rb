class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :article, :customer
      t.text :content
      t.integer :parent_id
      t.boolean :is_pin, default => "false"
      t.timestamps
    end
  end
end
