class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update_archive]

  def index
    @course = Course.order(number_enrollment: :desc).limit(20)
    @rate_course = Course.order(rate: :desc).limit(5)
    @free_course = Course.where(is_free: true).limit(5)
    @topic = Topic.all
    @top_view_article = Article.order(view_number: :desc).limit(10)
  end

  def add_course_to_archived
    course = Course.find(params[:slug])
    CustomerCourse.create(customer_id: current_user.id, course_id: course.id, is_save: true)
  end

  def enroll_courses
    enroll_course = Course.find(params[:slug])
    CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, is_save: true, enrollment_date: Date.now)
  end

  def show
    # @course_index = select("courses.*, customer_courses.*").joins(:customer_courses).where()
    @list_article = Article.joins(:courses).where('courses.id = ?', @course.id)
  end

  def customer_home
    @my_courses = Course.select(:name, :id).where(c).limit(5)
    @topic = Topic.all.limit(8)
  end

  def mycourse
    @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)
  end

  def archived_courses
    @archived_course = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND is_save = ?', current_user.id, true)
  end


  def update_archive
    # @archived_course = CustomerCourse.find(params[:slug])
    @archived_course = CustomerCourse.find(params[:course_id])

    respond_to do |format|
      if @archived_course.update_attribute("is_save", !@archived_course.is_save)
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @archived_course.errors, status: :unprocessable_entity }
      end
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
