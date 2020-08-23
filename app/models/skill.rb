class Skill < ApplicationRecord
  has_many :article_skills
  has_many :articles, through: :article_skills

  has_many :course_preskills

  class << self
    def name_and_id
      pluck :name, :id
    end
  end
end

