class Article < ApplicationRecord
  has_many :course_articles
  has_many :courses, through: :course_articles

end
