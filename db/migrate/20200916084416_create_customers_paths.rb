class CreateCustomersPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :customers_paths do |t|
      t.belongs_to :customer
      t.belongs_to :careerpaths
      t.timestamps
    end
  end
end
