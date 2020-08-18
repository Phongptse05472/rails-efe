class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
  end

  def show
    @show_leftside = false
    @article_detail = Article.select("articles.*, article_skills.* ").joins(:article_skills).where(id: params[:id])
    @author = Customer.joins(:customer_articles).where("article_id = ? AND is_owner = true", @article.id)

    @course = Course.friendly.find(params[:course_slug])
    #right side - List article in course
    @list_article_right = Article.joins(:courses).where('courses.id = ?', @course.id).order(:created_at)

    @index_list_article = @list_article_right.pluck(:id).index(@article_detail.ids.first)

    @comment = Comment.new
    @comment_user = Comment.where(:article_id => @article.id).custom_display
    @comment_pin = @comment_user.where("is_pin = true").custom_display.limit(1)
    cus_article = CustomerArticle.where("customer_id = ? AND article_id = ?", current_user.id, @article.id)

    if !cus_article.exists?
      cus_article = CustomerArticle.create(customer_id: current_user.id, article_id: @article.id, time_point: 0.0)
    else
    end
    @cus_article = CustomerArticle.where("customer_id = ? AND article_id = ?", current_user.id, @article.id)

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
