class Comment < ApplicationRecord
  # comments in 1 article
  belongs_to :article

  # comments is wrote by 1 user
  belongs_to :customer
  validates :content, presence: true
  scope :custom_display, -> { order(created_at: :desc)}
end
