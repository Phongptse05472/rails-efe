class CreateLoLos < ActiveRecord::Migration[6.0]
  def change
    create_table :lo_los do |t|
      t.references :lo, index: true , foreign_keys: true
      t.references :lo_req, index: true
      t.timestamps null: false
    end

    add_foreign_key :lo_los, :los, column: :lo_req_id

  end
end
