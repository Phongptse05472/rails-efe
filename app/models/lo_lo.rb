class LoLo < ApplicationRecord
  belongs_to :lo
  belongs_to :lo_req, class_name: "Lo"
end
