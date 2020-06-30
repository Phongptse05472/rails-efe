class Topic < ApplicationRecord
  has_many :topic_courses
  has_many :courses, through: :topic_courses

end
