class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
  end

  def show
    @show_leftside = false
    @article_detail = Article.all.where(id: params[:id])
    @course = Course.friendly.find(params[:course_slug])
    #right side - List article in course
    @list_article_right = Article.joins(:courses).where('courses.id = ?', @course.id).order(:created_at)

    @comment = Comment.new

    @comment_user = Comment.where(:article_id => @article.id).custom_display

    @comment_print = @comment_user.where("is_print = true").custom_display

  end



  # GET /articles/1/edit
  def edit
  end

  # def comments
  #   @comments = Comment.new
  #   @comments = Comment.custom_display
  # end

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
