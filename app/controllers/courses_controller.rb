class CoursesController < ApplicationController
  before_action  :set_course, only: [:show]
  # before_save :to_slug


  # GET /courses
  # GET /courses.json
  def index

    #hot course
    @course = Course.order(number_enrollment: :desc).limit(20)

    @rate_course = Course.order(rate: :desc).limit(5)

    @free_course = Course.where(is_free: true).limit(5)

    @topic = Topic.all

    @top_view_article =Article.order(view_number: :desc).limit(10)


  end


  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.friendly.find(params[:id])
    # @free_course = Course.friendly.find(params[:id])
    # @rate_course = Course.friendly.find(params[:id])

    @list_article = Article.joins(:courses).where('courses.id = ?', @course)

  end

  def customer_home

  end

  def mycourse
  end

  def archived_courses
  end

  def favor_articles
  end

  def search
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit

    # @course.attachment_changes['image'].attachable

  end



  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
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
    @course = Course.friendly.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :image, :description, :is_free, :is_save, :is_owner, :rate, :number_enrollment, :enrollment_date)
  end

  # def set_slug
  #   @transaction = Transaction.find_by slug: params[:slug]
  # end
end
