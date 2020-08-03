class CustomerCourse < ApplicationRecord

  scope :customer_id, -> {where customer_id: current_user.id}

  belongs_to :customer
  belongs_to :course

end
