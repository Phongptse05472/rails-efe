json.extract! article, :id, :title, :description, :link_article, :tag, :duration, :number_complete, :is_free, :link_attach_file, :created_at, :updated_at
json.url article_url(article, format: :json)
