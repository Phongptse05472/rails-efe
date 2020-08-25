class Customer < ApplicationRecord
  include PgSearch::Model
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


  # mount_uploader :avatar , ImageUploader
  has_many :comments

  pg_search_scope :search_list, against:[
    [:id, 'A'],
    [:name, 'B'],
    [:roll_number, 'C']
  ], using: {
    tsearch: {
          prefix: true,
          dictionary: 'english',
          any_word: true,
      },
  }

  scope :by_id, -> (id) { where("id= ?", id)}

end
