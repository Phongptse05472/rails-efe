class Role < ApplicationRecord
  belongs_to :customer, optional: true
end
