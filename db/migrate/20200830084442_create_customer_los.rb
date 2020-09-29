class CreateCustomerLos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_los do |t|
      t.belongs_to :customer
      t.belongs_to :lo
      t.index [:customer_id, :lo_id], unique: true
      t.timestamps
    end
  end
end
