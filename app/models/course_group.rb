class CourseGroup < ApplicationRecord
    belongs_to :group
    belongs_to :course
end