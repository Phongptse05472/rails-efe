class Comment < ApplicationRecord

  # comment in 1 article
  belongs_to :article

  # comment is wrote by 1 user
  belongs_to :customer

end
