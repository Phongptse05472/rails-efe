class CourseProgression < ApplicationRecord
  #customer_course through: course_progression
  belongs_to :course
  belongs_to :customer



end
