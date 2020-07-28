class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update_favor]

  def index
  end

  def show
    @show_leftside = false
    @article_detail = Article.all.where(id: params[:id])
    @course = Course.friendly.find(params[:course_slug])
    #right side - List arrticle in course
    @list_article_right = Article.joins(:courses).where('courses.id = ?', @course.id)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  def favor_articles
    @favor_article = Article.select("articles.*, customer_articles.*").joins(:customer_articles).where('customer_id = ? AND is_favor = ?', current_user.id, true)
  end

  def update_favor
    @favor_article = CustomerArticle.find(params[:id])

    respond_to do |format|
      if  @favor_article.update_attribute("is_favor", !@favor_article.is_favor)
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @favor_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /articles/1/edit
  def edit
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description, :link_article, :tag, :duration, :number_complete, :view_number, :is_free, :link_file_attach)
  end
end
