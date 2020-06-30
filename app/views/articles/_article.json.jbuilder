json.extract! article, :id, :title, :description, :link_article, :tag, :duration, :number_complete, :view_number, :is_free, :is_favor, :is_owner, :link_file_attach, :created_at, :updated_at
json.url article_url(article, format: :json)
