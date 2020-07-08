class Article < ApplicationRecord
  #course_article through: course_article
  has_many :course_articles
  has_many :courses, through: :course_articles

  #customer_article through: article_progression
  has_many :article_progressions
  has_many :customers, through: :article_progressions


end
