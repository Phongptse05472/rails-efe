class CreateCustomerLos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_los do |t|
      t.belongs_to :customer
      t.belongs_to :lo
      t.timestamps
    end
  end
end
