class CourseArticle < ApplicationRecord
  belongs_to :course
  belongs_to :article

  accepts_nested_attributes_for :article
end