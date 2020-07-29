class CustomersCoursesController < ApplicationController

  #my course page
  def index
    @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)
  end

  #customer home page
  def customer_home
    @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)
    @topic = Topic.all.limit(8)
  end


  def add_course_to_archived
    course = Course.find(params[:slug])
    CustomerCourse.create(customer_id: current_user.id, course_id: course.id, is_save: true)
  end

  def enroll_courses
    enroll_course = Course.find(params[:slug])
    CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, is_save: true, enrollment_date: Date.today)
  end

  def archived_courses
    @archived_course = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND is_save = ?', current_user.id, true)
  end

  # def create
  #   course = Course.find(params[:slug])
  #   CustomerCourse.create(customer_id: current_user.id, course_id: course.id, is_save: true)
  # end

  def update
    # @archived_course = CustomerCourse.find(params[:slug])
    @archived_course = CustomerCourse.find_by(course_id: params[:id], customer_id: current_user.id)
    respond_to do |format|
      if @archived_course.update_attribute("is_save", !@archived_course.is_save)
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @archived_course.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def customer_course_params
    params.require(:customers_course).permit(customer_id: current_user.id, course_id: course.id, is_save: true)
  end

end
