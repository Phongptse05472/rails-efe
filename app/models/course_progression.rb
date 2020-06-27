class CourseProgression < ApplicationRecord
  # 1 user can have many procession
  belongs_to :customer

  # 1 progression have 1 courses.rb
  belongs_to :course

end
