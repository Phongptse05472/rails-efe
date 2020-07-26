class CreateCustomerCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_courses do |t|
      t.belongs_to :customer
      t.belongs_to :course
      t.integer :customer_id
      t.integer :course_id
      t.boolean :is_owner
      t.boolean :is_save
      t.float :progression
      t.date :enrollment_date

      t.timestamps
    end
  end
end
