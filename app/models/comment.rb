class Comment < ApplicationRecord
  belongs_to :customer
  has_rich_text :body

  #polymorphic Comment
  belongs_to :commentable, polymorphic: true
  has_many :comments , as: :commentable, dependent: :destroy

end
