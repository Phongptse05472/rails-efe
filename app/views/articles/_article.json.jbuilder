json.extract! article, :id, :CourseID, :ArticleTitle, :Description, :Tag, :Duration, :NumberComplete, :IsFree, :LinkFileAttach, :created_at, :updated_at
json.url article_url(article, format: :json)
