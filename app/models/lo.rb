class Lo < ApplicationRecord
  has_many :article_los
  has_many :articles, through: :article_los

  has_many :lo_los
  has_many :req_los ,through: :lo_los

  has_many :paths_los
  has_many :careerpaths, through: :paths_los
end
