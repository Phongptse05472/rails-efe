class CreatePathGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :path_groups do |t|
      t.belongs_to :careerpath
      t.belongs_to :group
      t.belongs_to :level
      t.timestamps
    end
  end
end