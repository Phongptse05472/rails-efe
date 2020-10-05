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

  pg_search_scope :search_list, against:[
    [:name, 'A']
  ], using: {
    tsearch: {
          prefix: true,
          dictionary: 'english',
          any_word: true,
      },
  }
  
  scope :by_id, ->(id) { where("id= ?", id)}
  scope :by_rates, ->(rate) { where("rate = ?", rate)}
  scope :by_levels, ->(level) { where("level = ?", level)}
  scope :by_prices, ->(price) { where("price = ?", price)}

  STEPS = %i(landing_page create_content over_view)

  has_many :course_groups
  has_many :groups, through: :course_groups

  has_many :course_articles
  has_many :articles, through: :course_articles

  has_many :customer_courses
  has_many :customers, through: :customer_courses

  accepts_nested_attributes_for :articles
  accepts_nested_attributes_for :course_groups
  accepts_nested_attributes_for :customer_courses

  def update_slug
    self.slug = name.parameterize
  end

  def to_params
    slug
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end

  mount_uploader :image, ImageUploader

end
