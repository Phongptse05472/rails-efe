class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update_archive]


  # GET /courses
  # GET /courses.json
  def index

    #hot course
    @course = Course.order(number_enrollment: :desc).limit(20)

    @rate_course = Course.order(rate: :desc).limit(5)

    @free_course = Course.where(is_free: true).limit(5)

    @topic = Topic.all

    @top_view_article = Article.order(view_number: :desc).limit(10)


  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    #@course = Course.friendly.find(params[:slug])
    # @free_course = Course.friendly.find(params[:id])
    # @rate_course = Course.friendly.find(params[:id])

    @list_article = Article.joins(:courses).where('courses.id = ?', @course)

  end

  def customer_home
    @my_courses = Course.select(:name, :id).where('customer_id = ?', current_user.id).limit(5)
    @topic = Topic.all.limit(8)
  end

  def mycourse
    @my_courses = Course.all.where('customer_id = ?', current_user.id)

  end

  def archived_courses
    @archived_course = Course.all.where('customer_id = ? AND is_save = ?', current_user.id, true)

  end

  def update_archive
    @archived_course = Course.friendly.find(params[:slug])

    if @archived_course.is_save == true
      @archived_course.update_attribute("is_save", "false")
    else
      @archived_course.update_attribute("is_save", "true")
    end

    respond_to do |format|
      if @archived_course.save
        # format.html { redirect_to @archived_course, notice: 'Save Course was successfully update.' }
        # format.json { render :show, status: :created, location: @archived_course }
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.html { render :new }
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

  # DELETE /courses/
  # DELETE /courses/1.json
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

  # def set_slug
  #   @transaction = Transaction.find_by slug: params[:slug]
  # end
end
