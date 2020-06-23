class Course < ApplicationRecord
  #course_article
  has_many :course_articles
  has_many :articles, through: :course_articles

  #topic_course
  has_many :topic_courses
  has_many :topics, through: :topic_courses

end
