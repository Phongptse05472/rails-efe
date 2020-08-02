class CreateCustomerCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_courses do |t|
      t.belongs_to :customer
      t.belongs_to :course
      t.boolean :is_owner
      t.boolean :is_save , default: false
      t.integer :current_article_id
      t.float :progression, default: 0
      t.date :enrollment_date

      t.timestamps
    end
  end
end
