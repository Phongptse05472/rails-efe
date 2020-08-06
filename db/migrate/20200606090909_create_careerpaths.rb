class CreateCareerpaths < ActiveRecord::Migration[6.0]
  def change
    create_table :careerpaths do |t|
      t.string :name
      t.string :rank
      t.timestamps
    end
  end
end