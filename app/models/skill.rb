class Skill < ApplicationRecord
  has_many :articles, through: :article_skills
end

