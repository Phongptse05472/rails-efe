class Admin::ArticlesController < Admin::AdminController

  def index
    if current_user.customer.role_id != 1
      redirect_to home_path
    end
    @article = Article.all.order(created_at: :desc)
    @pagy, @article_paging = pagy(@article, items: 10)
  end

  def deactivate_article
    @article_disable = Article.find(params[:id])
    @article_disable.update(is_active: !@article_disable.is_active)
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

end