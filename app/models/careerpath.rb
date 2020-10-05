class Careerpath < ApplicationRecord
  has_many :path_groups
  has_many :groups, through: :path_groups

  has_many :path_los
  has_many :los, through: :path_los

  has_many :customers_paths
  has_many :customers, through: :customers_paths

  class << self
    def name_and_id
      pluck :name, :id
    end
  end
end

