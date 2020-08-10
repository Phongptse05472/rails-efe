class Careerpath < ApplicationRecord
  has_many :groups, through: :path_groups
end

