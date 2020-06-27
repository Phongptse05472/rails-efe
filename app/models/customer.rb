class Customer < ApplicationRecord
# 1 user have one User_info
  belongs_to :user
# # 1 User can have many role
  has_one :role
# # 1 user can have many courses.rb
  has_many :customer_courses
  has_many :courses, through: :customer_courses
# # 1 user can have many progression
#   has_many :course_progressions
# # 1 user can have many comment
#   has_many :comments

end
