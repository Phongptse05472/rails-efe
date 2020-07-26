class Course < ApplicationRecord
  include PgSearch::Model
  before_create :update_slug


  extend FriendlyId
  friendly_id :name, use: [:slugged]

  pg_search_scope :search, against:[
      [:name, 'A'],
      [:description, 'B']
  ], using: {
      tsearch: {
          prefix: true,
          dictionary: 'english',
          any_word: true,
      },
  }

  scope :by_rates, ->(rate) { where("rate = ?", rate)}
  scope :by_levels, ->(level) { where("level = ?", level)}
  scope :by_prices, ->(price) { where("price = ?", price)}

  # scope :search_by_criteria, lamda { |filter|
  #   cakes = all
  #   cakes = cakes.by_rates(filter[:rate]) if filter[:rate].present?
  #   cakes = cakes.by_prices(filter[:price]) if filter[:price].present?
  #   cakes = cakes.by_levels(filter[:level]) if filter[:level].present?
  # }

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
