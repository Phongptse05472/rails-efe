class Article < ApplicationRecord
  #course_article
  has_many :course_articles
  has_many :courses, through: :course_articles
end
