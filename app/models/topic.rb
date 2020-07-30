class Topic < ApplicationRecord
  before_create :update_slug, :to_params


  extend FriendlyId
  friendly_id :name, use: [:slugged]

  has_many :topic_courses
  has_many :courses, through: :topic_courses


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

