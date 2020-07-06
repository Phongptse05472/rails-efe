class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    #hot courses
    @courses = Course.order(number_enrollment: :desc).limit(10)

    respond_to do |format|
      format.html
      format.json {render :json =>  @course}
    end
    # @rate_course = Course.order(rate: :desc).limit(5)
    # @free_course = Course.where(is_free: true).limit(5)
    # @sidebar_course = Course.select(:name, :enrollment_date).order(enrollment_date: :desc).limit(5)
    #
    # @topic_course = Course.find_by(params[:id])
    # # @topic_course = Course.find_by(params[:id])
    #
    # @course_topic = Topic.includes(:courses).all


    json_response(@course)
    # json_response(@rate_course)
    # json_response(@free_course)


  end


  # GET /courses/1
  # GET /courses/1.json
  def show
    if params[:id] == "this-will-trigger-an-error"
      render json: {success: false}, status: 500
    else
      @course = Course.find_by(params[:id])
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit

  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        # format.html { redirect_to @courses, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        # format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        # format.html { redirect_to @courses, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        # format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      # format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :image, :description, :is_free, :is_save, :is_owner, :rate, :number_enrollment, :enrollment_date, :image)
  end
end