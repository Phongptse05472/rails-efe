class CourseProgression < ApplicationRecord
  # 1 user can have many procession
  belongs_to :user_info

  # 1 progression have 1 course
  belongs_to :course

end
