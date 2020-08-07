class Group < ApplicationRecord
  before_create :update_slug, :to_params

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  has_many :skills
  has_many :careerpaths, :through => :path_groups
  has_and_belongs_to_many :courses

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
