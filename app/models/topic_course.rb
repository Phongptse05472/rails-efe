class TopicCourse < ApplicationRecord
  belongs_to :topic
  belongs_to :course
end