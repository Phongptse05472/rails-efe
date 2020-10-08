class Skill < ApplicationRecord
  has_many :article_skills
  has_many :articles, through: :article_skills
  # has_many :article_skills
  # has_many :articles, through: :article_skills
  # belongs_to :group

  scope :by_group_ids, lambda { |group_id| where(:group_id => group_id) }

  class << self
    def name_and_id

      pluck :name, :id
    end
    end
end

