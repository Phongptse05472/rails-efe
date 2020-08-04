class CustomersCoursesController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  #my course page
  def index
    @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)
  end

  #customer home page
  def customer_home
    @my_courses_home = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)
    @topic = Topic.all.limit(8)

    @hot_course = Course.order(number_enrollment: :desc).limit(20)
    @rate_course = Course.order(rate: :desc).limit(5)
    @new_course = Course.joins(:customer_courses).order(created_at: :desc).limit(5)
    @topic = Topic.all
    @top_view_article = Article.order(view_number: :desc).limit(10)
  end


  def add_course_to_archived
    course = Course.find(params[:slug])
    @check_archived_course = CustomerCourse.where('customer_id = ? AND course_id = ? AND is_save = true AND customer_courses.enrollment_date IS NOT null', current_user.id, course.id)
    if @check_archived_course.exists?
      flash.alert = "List archive already have"
    else
      CustomerCourse.create(customer_id: current_user.id, course_id: course.id, is_save: true)
      flash.alert = "Added to list archived course"
    end
  end

  def enroll_courses
    enroll_course = Course.find(params[:slug])
    course = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, enroll_course.id)
    course_is_archive = CustomerCourse.where('customer_id = ? AND course_id = ? AND is_save = true', current_user.id, enroll_course.id)


    @article = Article.joins(:courses).where('courses.id = ?', enroll_course.id)
    @archived_course = CustomerCourse.find_by(course_id: params[:id], customer_id: current_user.id)

    if course_is_archive.exists?
      if @article.first.nil?
        course_is_archive.update(enrollment_date: Date.today)
        redirect_to course_path
      else
        course_is_archive.update(enrollment_date: Date.today, current_article_id:  @article.first.id)
        redirect_to course_article_path(enroll_course, @article.ids.first)
      end
    end

    if course.exists? == false

      if @article.first.nil?
        CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, is_save: true, enrollment_date: Date.today)
        redirect_to course_path
      else
        CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, current_article_id: @article.first.id, is_save: true, enrollment_date: Date.today)
        redirect_to course_article_path(enroll_course, @article.ids.first)
      end

      # if @article.first.nil?
      #   redirect_to course_path
      # else
      #   redirect_to course_article_path(enroll_course, @article.first.current_article_id)
      # end



    end

  end

  def click_on_article
    enroll_course = Course.find(params[:slug])
    current_article = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, enroll_course.id)
    current_article.update_attribute(:current_article_id, current_article.first.current_article_id)
    redirect_to click_on_article_path(enroll_course, current_article.first.current_article_id)
  end

  def archived_courses
    @archived_course = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND is_save = ?', current_user.id, true)
  end

  def update
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
  # def customer_course_params
  #   params.require(:customers_course).permit(customer_id: current_user.id, course_id: course.id, is_save: true)
  # end

end
