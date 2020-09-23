class CustomersCoursesController < ApplicationController
  #my course page

  def index
    @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id).order("customer_courses.updated_at DESC")
    @pagy, @my_course_paging = pagy(@my_courses, items: 5)
  end

  #customer home page
  def customer_home
    if current_user.customer.role_id == 1
      redirect_to admin_customers_path
    end
    @my_courses_home = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id).order("customer_courses.updated_at DESC")
    @number_enroll = CustomerCourse.where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id)

    @topic = Group.all.limit(8)

    #check user enrolled course?
    @course_ids = CustomerCourse.where("enrollment_date IS NOT NULL").pluck('course_id')

    #all course which user not enrolled
    @hot_course = Course.where(:is_active => true).where.not(id: @course_ids).order(number_enrollment: :desc).limit(20)
    @rate_course = Course.where(:is_active => true).where.not(id: @course_ids).order(rate: :desc).limit(20)
    @new_course = Course.where(:is_active => true).where.not(id: @course_ids).order(created_at: :desc).limit(20)

    #check user viewed article?
    @article_ids = CustomerArticle.where("is_viewed = true").pluck("article_id")

    @top_view_article = Article.where(:is_active => true).where.not(id: @article_ids).order(view_number: :desc).limit(20)

    @course_article = Course.joins(:course_articles).where("article_id IN (?) ", @top_view_article.ids)
    cid = current_user.id
    # recommender course

    @cus_path = CustomersPath.where(customer_id: cid)
    if !@cus_path.blank?
      require "faraday"
      require "faraday_middleware"
      response = Faraday.get 'http://localhost:8080/RecommendAPI/APIRecommend?cid=' + cid.to_s
      data = JSON.parse(response.body)
      @arr_course_id = [].uniq
      data.each do |d|
        @arr_course_id << d["id"]
      end
      Faraday::Error #or more specific error type
      @recommender_course = Course.where('id IN (?)', @arr_course_id).where.not(id: @course_ids).order(number_enrollment: :desc).limit(20)
    end
  end

  def insert_careerpath
    @customer = Customer.where("user_id = ?", current_user.id)
    @customer_path = CustomersPath.new(customer_path_params)
    @customer_path.save
    user = User.where("id = ?", current_user.id)
    user.update(sign_in_count: user.first.sign_in_count += 1)
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

  def customer_path_params
    params.permit(:customer_id, :careerpath_id)
  end

  def enroll_courses
    enroll_course = Course.find(params[:slug])
    course = CustomerCourse.where('customer_id = ? AND course_id = ?', current_user.id, enroll_course.id)
    @article = Article.joins(:courses).where('courses.id = ?', enroll_course.id)
    @archived_course = CustomerCourse.find_by(course_id: params[:id], customer_id: current_user.id)
    # when record don't have in customer_course
    if course.blank?
      CustomerCourse.create(customer_id: current_user.id, course_id: enroll_course.id, is_save: true, enrollment_date: Date.today)
      # chech when this course have list article or not
      if !@article.ids.first.nil?
        # if have redirect to first article in list article
        redirect_to course_article_path(enroll_course, @article.ids.first)
      else
        # if haven't reload page course detail
        redirect_to course_path
      end
    else
      current_article = course.first.current_article_id
      if current_article.nil?
        if !@article.ids.first
          redirect_to course_path
        else
          redirect_to course_article_path(enroll_course, @article.ids.first)
        end
      else
        redirect_to course_article_path(enroll_course, course.first.current_article_id)
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
    @archived_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? AND is_save = ?', current_user.id, true).order("customer_courses.updated_at DESC")
    @pagy, @archived_courses_paging = pagy(@archived_courses, items: 5)
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
