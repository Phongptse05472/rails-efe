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

  STEPS = %i(over_view create_content comfirmed)


  # has_one_attached :image

  # has_and_belongs_to_many :groups


  has_many :course_groups
  has_many :groups, through: :course_groups

  has_many :course_articles
  has_many :articles, through: :course_articles

  has_many :customer_courses
  has_many :customers, through: :customer_courses



  def update_slug
    self.slug = name.parameterize
  end

  def to_params
    slug
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end

end
