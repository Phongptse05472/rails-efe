class ArticleProgression < ApplicationRecord
  #customer_article through:article_progression
  has_many :customers
  has_many :articles
end
