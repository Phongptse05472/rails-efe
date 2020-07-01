class Article < ApplicationRecord
  has_many :course_articles
  has_many :courses, through: :course_articles

  has_many :comments , as: :commentable, dependent: :destroy
end
g