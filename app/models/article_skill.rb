class ArticleSkill < ApplicationRecord
    belongs_to :skill
    belongs_to :article
  end