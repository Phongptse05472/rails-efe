class CreatePathsLos < ActiveRecord::Migration[6.0]
  def change
    create_table :path_los do |t|
      t.belongs_to :careerpath
      t.belongs_to :lo
      t.timestamps
    end
  end
end
