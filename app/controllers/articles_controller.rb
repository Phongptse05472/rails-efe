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
