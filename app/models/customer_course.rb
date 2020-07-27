class CustomerCourse < ApplicationRecord

  # extend FriendlyId
  # friendly_id :name, use: [:slugged]

  belongs_to :customer
  belongs_to :course
end
