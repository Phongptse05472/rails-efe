class Article < ApplicationRecord
  #course_article through: course_article
  has_many :course_articles
  has_many :courses, through: :course_articles

  #customer_article through: article_progression
  has_many :customer_articles
  has_many :customers, through: :customer_articles

  has_many :article_skills, through: :article_skills

  has_one_attached :image


end
