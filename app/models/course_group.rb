class CourseGroup < ApplicationRecord
    belongs_to :group, optional: true
    belongs_to :course
end