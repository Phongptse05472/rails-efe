class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show]

  def index
    if current_user.present?
      redirect_to user_home_path
    end
    @course = Course.order(number_enrollment: :desc).limit(20)
    @rate_course = Course.order(rate: :desc).limit(5)
    @free_course = Course.where(is_free: true).limit(5)
    @topic = Group.all
    @top_view_article = Article.order(view_number: :desc).limit(10)

    # binding.pry

  end

  def show

    article = Article.joins(:courses).where('courses.id = ?', @course.id)

    # @skill = Skill.joins(:article_skill).where("article_id IN (?) " , article.ids).group(:id)
    @skill = Skill.joins(:article_skills).where("article_id IN (?) " , article.ids).group(:id)

    if current_user.present?
      @check_archived_course = CustomerCourse.where('customer_id = ? AND course_id = ? AND customer_courses.enrollment_date IS null', current_user.id, @course.id)
      if !@check_archived_course.exists?
        @course_detail = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND course_id = ?', current_user.id, @course.id)
      else
        calculate_progression
      end

    else
      @course_detail = Course.where('course_id = ?', @course.id)
    end
    @pagy, @list_article = pagy(Article.joins(:courses).where('courses.id = ?', @course.id).order(:created_at),items: 5)

  end

  def calculate_progression
    total_article = Article.joins(:course_articles).where('course_id = ?', @course.id).count
    viewed_article = Article.joins(:course_articles).joins(:customer_articles).where('course_id = ? AND is_viewed = true', @course.id).count
    #fix exception FloatDomainError
    if total_article == 0
      progress = 0
    else
      progress = viewed_article.to_f / total_article.to_f * 100
    end
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

  protected

  def authenticate_user!
    if user_signed_in?
      # super
    else
      redirect_to user_home_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
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
