class Course < ApplicationRecord
  #course_article
  has_many :course_articles
  has_many :articles, through: :course_articles

  #topic_course
  has_many :topic_courses
  has_many :topics, through: :topic_courses

  #courses are only had by one user
  belongs_to :user_info

  # 1 course have 1 progression
  has_one :course_progression

end
