json.extract! article, :id, :courseID, :articleTitle, :description, :tag, :duration, :numberComplete, :isFree, :linkFileAttach, :created_at, :updated_at
json.url article_url(article, format: :json)
