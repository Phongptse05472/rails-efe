class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @course = Course.order(number_enrollment: :desc).limit(20)
    @rate_course = Course.order(rate: :desc).limit(5)
    @free_course = Course.where(is_free: true).limit(5)
    @topic = Topic.all
    @top_view_article = Article.order(view_number: :desc).limit(10)


  end

  def show
    # @course_index = select("courses.*, customer_courses.*").joins(:customer_courses).where()
    @list_article = Article.joins(:courses).where('courses.id = ?', @course.id).order(:created_at)

    currennt_article_id = CustomerCourse.find_by(:customer_id => current_customer.id, :course_id => @course.id).current_article_id
    @current_article = Article.find_by(:article_id => currennt_article_id)
    if !@current_article.present? do
        @current_article = @course.course_articles.first
    end
  end

  def search
    if params[:q].present?
      @search_result = Course.search(params[:q])
    else
      @search_result = []
    end
  end

  def enroll_course
    current_user
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.friendly.find(params[:slug])
  end


  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :image, :description, :is_free, :is_save, :is_owner, :rate, :number_enrollment, :enrollment_date)
  end

end
