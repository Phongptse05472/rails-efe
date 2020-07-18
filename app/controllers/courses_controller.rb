class CoursesController < ApplicationController
  # before_action  :set_course, only: [:show]
  # before_action  :set_course

  # GET /courses
  # GET /courses.json
  def index
    #hot course
    # byebug
    @courses = Course.order(number_enrollment: :desc).limit(20)
    # @rate_course = Course.order(rate: :desc).limit(5)
    # @free_course = Course.where(is_free: true).limit(5)
    #
    # @topic = Topic.all
    #
    # @top_view_article =Article.order(view_number: :desc).limit(5)

    # cover_url = rails_blob_path(@event.cover, disposition: "attachment", only_path: true)

  end


  # GET /courses/1
  # GET /courses/1.json
  def show
  rescue ActiveRecord::RecordNotFound
    redirect_to :controller => "courses", :action => "index"
    return
  end

  # GET /courses/new
  def new
    @courses = Course.new
  end

  # GET /courses/1/edit
  def edit
    # @course.attachment_changes['image'].attachable

  end



  # POST /courses
  # POST /courses.json
  def create
    @courses = Course.new(course_params)

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
      if @courses.update(course_params)
        format.html { redirect_to @courses, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @courses }
      else
        format.html { render :edit }
        format.json { render json: @courses.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/
  # DELETE /courses/1.json
  def destroy
    @courses.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @courses = Course.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :image, :description, :is_free, :is_save, :is_owner, :rate, :number_enrollment, :enrollment_date)
  end
end
