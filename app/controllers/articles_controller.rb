class ArticlesController < ApplicationController
  before_action :get_course, :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Course.find_by(params[:id])
    #
    @article_by_course = Course.find_by(params[:id])
    # @article_by_course = Course.where("course_id = ?"  ,course_articles.id).order('created_at DESC')

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
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

  def get_course
    @course = Course.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :link_article, :tag, :duration, :number_complete, :view_number, :is_free, :is_favor, :is_owner, :link_file_attach)
    end
end
