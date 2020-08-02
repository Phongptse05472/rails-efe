class CreateCareerpaths < ActiveRecord::Migration[6.0]
  def change
    create_table :careerpaths do |t|
      t.string :name
      t.string :rank
      t.timestamps
    end
  end

  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
  end

  def change
    create_table :path_groups do |t|
      t.belongs_to :careerpath
      t.belongs_to :group
      t.string :level
      t.timestamps
    end
  end

  def change
    create_table :skills do |t|
      t.string :name
      t.belongs_to :group
      t.timestamps
    end
  end

  def change
    create_table :levels do |t|
      t.string :name
      t.timestamps
    end
  end
end