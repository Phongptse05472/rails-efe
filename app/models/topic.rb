class Topic < ApplicationRecord
  before_create :update_slug

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  has_many :topic_courses
  has_many :courses, through: :topic_courses

  def update_slug
    self.slug = name.parameterize
  end

  def to_params
    slug.friendly_id
  end
end
