class Customer < ApplicationRecord
  # 1 user have one User_info
  belongs_to :user
# # 1 User can have many role
  has_one :role

#customer_course through: course_progression
  has_many :course_progressions
  has_many :courses, through: :course_progressions

#customer_article through: article_progression
  has_many :article_progressions
  has_many :articles, through: :article_progressions

#active storage
  has_one_attached :image
end
