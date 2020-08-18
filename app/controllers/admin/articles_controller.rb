class Admin::ArticlesController < Admin::AdminController

  def index
    # if @admin.blank?
    #   redirect_to home_path
    # end

    @article = Article.all.order(created_at: :desc)
    @pagy, @article_paging = pagy(@article, items: 10)


  end

end