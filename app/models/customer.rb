class Customer < ApplicationRecord
  # 1 user have one User_info
  belongs_to :user
# # 1 User can have many role
  has_one :role

#customer_course through: course_progression
  has_many :customer_courses
  has_many :courses, through: :customer_courses

#customer_article through: article_progression
  has_many :customer_articles
  has_many :articles, through: :customer_articles

#active storage
  has_one_attached :avatar

  has_many :comments
end
