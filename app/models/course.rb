class Course < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  #course_article
  has_many :course_articles
  has_many :articles, through: :course_articles

  #topic_course
  has_many :topic_courses
  has_many :topics, through: :topic_courses

  #courses are only had by one user
  belongs_to :customer, optional: true

  #activeStorage image
  has_one_attached :image

  #customer_course through: course_progression
  has_many :course_progressions
  has_many :customers, through: :course_progressions




end
