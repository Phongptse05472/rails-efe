class UserInfo < ApplicationRecord
# 1 user have one User_info
  belongs_to :user
# 1 User can have many role
  has_many :roles
# 1 user can have many course
  has_many :courses
# 1 user can have many progression
  has_many :course_progressions
# 1 user can have many comment
  has_many :comments

end
