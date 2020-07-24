class Course < ApplicationRecord
  before_create :update_slug


  extend FriendlyId
  friendly_id :name, use: [:slugged]

  STEPS = %i(over_view create_content comfirmed)

  belongs_to :customer, optional: true  
  has_one_attached :image
  
  has_many :topic_courses
  has_many :topics, through: :topic_courses
  has_many :course_articles
  has_many :articles, through: :course_articles
  has_many :customer_courses
  has_many :customers, through: :customer_courses

  # def to_param
  #   "#{id}-#{name.parameterize}"
  # end

  def update_slug
    self.slug = name.parameterize
  end

  def to_params
    slug
  end
end
