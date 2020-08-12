class CustomersCoursesController < ApplicationController

  #my course page
  def index
    @pagy,  @my_courses = pagy(Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id), items: 5)
  end

  #customer home page
  def customer_home
    @my_courses_home = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)


    @topic = Group.all.limit(8)

    #check user enrolled course?
    @course_ids = CustomerCourse.where("enrollment_date IS NOT NULL").pluck('course_id')

    #all course which user not enrolled
    @hot_course = Course.where.not(id: @course_ids).order(number_enrollment: :desc).limit(20)
    @rate_course = Course.where.not(id: @course_ids).order(rate: :desc).limit(5)
    @new_course = Course.where.not(id: @course_ids).order(created_at: :desc).limit(5)

    #check user viewed article?
    @article_ids = CustomerArticle.where("is_viewed = true").pluck("article_id")

    @top_view_article = Article.where.not(id: @article_ids).order(view_number: :desc).limit(10)
  end


  def enroll_courses
    enroll_course = Course.find(params[:slug])
    course = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, enroll_course.id)
    # course_is_archive = CustomerCourse.where('customer_id = ? AND course_id = ? AND is_save IS NOT NULL', current_user.id, enroll_course.id)
    @article = Article.joins(:courses).where('courses.id = ?', enroll_course.id)
    @archived_course = CustomerCourse.find_by(course_id: params[:id], customer_id: current_user.id)
    if course.blank?
      if @article.first.nil?
        CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, is_save: true, enrollment_date: Date.today)
        redirect_to course_path
      else
        CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, current_article_id: @article.first.id, is_save: true, enrollment_date: Date.today)
        redirect_to course_article_path(enroll_course, @article.ids.first)
      end
    else
      if @article.first.nil?
        course.update_all(is_save: true, enrollment_date: Date.today)
        redirect_to course_path
      else
        course.update_all(current_article_id: @article.first.id, is_save: true, enrollment_date: Date.today)
        redirect_to course_article_path(enroll_course, @article.ids.first)
      end

    end
  end

  def click_on_article
    enroll_course = Course.find(params[:slug])
    current_article = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, enroll_course.id)
    current_article.update_attribute(:current_article_id, current_article.first.current_article_id)
    redirect_to click_on_article_path(enroll_course, current_article.first.current_article_id)
  end

  def archived_courses
    @pagy, @archived_courses = pagy(Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND is_save = ?', current_user.id, true),items: 5)
  end


  def add_course_to_archived
    course = Course.find(params[:slug])
    archived_course = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, course.id).any?
    if archived_course == false
      CustomerCourse.create(customer_id: current_user.id, course_id: course.id, is_save: true)
    else

    end
  end

  def update
    @archived_courses = CustomerCourse.find_by(course_id: params[:id], customer_id: current_user.id)
    @archived_courses.update_attribute("is_save", !@archived_courses.is_save)
  end

end
