class CustomerLo < ApplicationRecord
    belongs_to :customer
    belongs_to :lo , optional: true
  end