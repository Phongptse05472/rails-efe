class Mentor::CoursesController < Mentor::MentorController
  include Wicked::Wizard
  before_action :load_course, except: :index

  steps :landing_page, :create_content, :over_view

  def index
    @pagy ,@mentor_course = pagy(Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id),items: 3)
    @pagy, @ref_article =  pagy(Article.joins(:course_articles).where('course_id is null').order(:created_at),items: 6)
  end

  def new
  end

  def show
    @step = step
    if session[:course_id] != nil
      @current_course = @course
    end
    render_wizard
  end

  def update  
    @step = step.to_s
    @course.assign_attributes course_params    

    unless step.to_sym == :create_content
      render_wizard @course
    else
      @course.save
    end

    session[:course_id] = @course.id
  end

  private
  def course_params
    params.require(:course).permit!
  end

  def load_course
    if step.to_sym == :landing_page
      @course = Course.new
    else
      @course = Course.find_by id: session[:course_id]
      @course.articles.build
    end
  end

end
