class Course < ApplicationRecord
  #course_article
  has_many :course_articles
  has_many :articles, through: :course_articles

  #topic_course
  has_many :topic_courses
  has_many :topics, through: :topic_courses

  #courses are only had by one user
  belongs_to :customer

  # 1 courses.rb have 1 progression
  has_one :course_progression

  #userInfo_course
  has_many :customer_courses
  has_many :customers , through: :customer_courses

end
