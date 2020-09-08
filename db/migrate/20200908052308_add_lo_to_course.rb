class AddLoToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :lo, :string
  end
end
