class Level < ApplicationRecord
  has_many :articles
  has_many :path_groups
end

