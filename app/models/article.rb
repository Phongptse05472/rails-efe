class Article < ApplicationRecord
  # article_course
  has_many :course_articles
  has_many :courses, through: :course_articles

  # 1 article can have many comment
  has_many :comments
end
