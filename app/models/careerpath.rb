class Careerpath < ApplicationRecord
  has_many :path_groups
  has_many :groups, through: :path_groups

  has_many :paths_los
  has_many :los, through: :paths_los
end

