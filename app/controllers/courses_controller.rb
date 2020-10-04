class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_course, only: [:show]

  def index
    if current_user.present?
      redirect_to user_home_path
    end
    @course = Course.where(:is_active => true).order(number_enrollment: :desc).limit(20)
    @rate_course = Course.where(:is_active => true).order(rate: :desc).limit(20)
    @free_course = Course.where(:is_active => true).where(is_free: true).limit(20)
    @topic = Group.all
    @top_view_article = Article.where(:is_active => true).order(view_number: :desc).limit(20)
  end

  def show
    course_lo_str = Course.where('courses.id = ?', @course.id)
    @course_lo_arr = course_lo_str.first.lo.tr('', '').split(';').map(&:to_i)
    @list_lo = Lo.where("id IN (?)", @course_lo_arr).group(:id)
    @skill = Skill.where("id IN (?)", @list_lo.pluck(:skill_id).uniq)
    lo_req = LoLo.where("lo_id IN (?)", @course_lo_arr)
    req = lo_req.pluck(:lo_req_id).uniq
    @lo_req = Lo.where("id IN (?)", req)

    if current_user.present?
      @check_archived_course = CustomerCourse.where('customer_id = ? AND course_id = ? AND customer_courses.enrollment_date IS null', current_user.id, @course.id)
      if !@check_archived_course.blank?
        @course_detail = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND course_id = ?', current_user.id, @course.id)
      else
        calculate_progression
      end
    else
      @course_detail = Course.where('course_id = ?', @course.id)
    end
    @list_articles = Article.joins(:courses).where('courses.id = ?', @course.id).order(id: :asc)
    if current_user.present?
      @list_article_viewed = CustomerArticle.joins(:article).where("is_viewed = true AND customer_id = ? AND article_id IN (?) ", current_user.id, @list_articles.ids)
    end
    @pagy, @list_article_paging = pagy(@list_articles, items: 5)
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
    @customers_courses_progression = CustomerCourse.where(customer_id: current_user.id, course_id: @course.id)
    @customers_courses_progression.update(progression: progress.round) # => progression
  end

  def search
    if params[:q].present?
      @search_result = Course.search(params[:q])
      @pagy, @search_result_paging = pagy(@search_result, items: 5)
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
