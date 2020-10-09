class Lo < ApplicationRecord
  has_many :article_los
  has_many :articles, through: :article_los

  has_many :lo_los
  has_many :req_los ,through: :lo_los

  has_many :path_los
  has_many :careerpaths, through: :path_los

  has_many :customer_los
  has_many :customers, through: :customer_los

  belongs_to :skill, optional: true
  scope :by_skill_id, ->(skill_id) { where("skill_id= ?", skill_id)}
  scope :by_skill_ids, lambda { |skill_id| where(:skill_id => skill_id) }

  class << self
    def name_and_id
      pluck :name, :id
    end
  end
end
