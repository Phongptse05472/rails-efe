class Skill < ApplicationRecord
  has_many :article_skills
  has_many :articles, through: :article_skills


end

