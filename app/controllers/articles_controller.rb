class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  skip_before_action :verify_authenticity_token
  def index
  end

  def show

    @article_detail = Article.select("articles.*, article_skills.* ").joins(:article_skills).where(id: params[:id])
    @author = Customer.joins(:customer_articles).where("article_id = ? AND is_owner = true", @article.id)

    @course = Course.friendly.find(params[:course_slug])
    #right side - List article in course
    @list_article_right = Article.joins(:courses).where('courses.id = ?', @course.id).order(id: :asc)
    @list_article_viewed= CustomerArticle.joins(:article).where("is_viewed = true AND customer_id = ? AND article_id IN (?) ",current_user.id, @list_article_right.ids)
    @index_list_article = @list_article_right.pluck(:id).index(@article_detail.ids.first)

    @comment = Comment.new
    @comment_user = Comment.where(:article_id => @article.id).custom_display
    @comment_pin = @comment_user.where("is_pin = true").custom_display.limit(1)
    cus_article = CustomerArticle.where("customer_id = ? AND article_id = ?", current_user.id, @article.id)

    if !cus_article.exists?
      CustomerArticle.create(customer_id: current_user.id, article_id: @article.id, time_point: 0.0)
    else
    end
    @cus_article = CustomerArticle.where("customer_id = ? AND article_id = ?", current_user.id, @article.id)
  end

  def get_link_article
    @course_article = Course.joins(:course_articles).where("article_id IN (?) " , @top_view_article.id)
    redirect_to course_path(@course_article)
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
