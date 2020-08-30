class ArticleLo < ApplicationRecord
  belongs_to :article
  belongs_to :lo , optional: true
end
