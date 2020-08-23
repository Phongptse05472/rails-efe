class Article < ApplicationRecord
  include PgSearch::Model
  #course_article through: course_article
  has_many :course_articles
  has_many :courses, through: :course_articles

  #customer_article through: article_progression
  has_many :customer_articles
  has_many :customers, through: :customer_articles

  has_many :article_skills
  has_many :skills, through: :article_skills

  has_many :article_los
  has_many :los, through: :article_los

  # has_one_attached :image
  pg_search_scope :search_list, against:[
    [:title, 'A']
  ], using: {
    tsearch: {
          prefix: true,
          dictionary: 'english',
          any_word: true,
      },
  }

  scope :by_id, -> (id) { where("id= ?", id)}

  mount_uploader :video, ImageUploader
  accepts_nested_attributes_for :skills, allow_destroy: true
end
