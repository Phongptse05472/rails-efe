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
    @check_archived_course = CustomerCourse.where('customer_id = ? AND course_id = ? AND customer_courses.enrollment_date IS null', current_user.id, @course.id)
    if !@check_archived_course.exists?
      @course_detail = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND course_id = ?', current_user.id, @course.id)
      @list_article = Article.joins(:courses).where('courses.id = ?', @course.id).order(:created_at)
    else
      calculate_progression
    end


  end

  def calculate_progression
    total_article = Article.joins(:course_articles).where('course_id = ?', @course.id).count
    viewed_article = Article.joins(:course_articles).joins(:customer_articles).where('course_id = ? AND is_viewed = true', @course.id).count
    progress = viewed_article.to_f / total_article.to_f * 100


    @customers_courses_progression = CustomerCourse.where(customer_id: current_user.id, course_id: @course.id).update_all(progression: progress.round) # => progression
  end

  def search
    if params[:q].present?
      @search_result = Course.search(params[:q])
    else
      @search_result = []
    end
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
