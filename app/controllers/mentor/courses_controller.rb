class Mentor::CoursesController < Mentor::MentorController
  before_action :load_course
   include Wicked::Wizard
  steps :new, :add_article, :over_view

  def index
    if current_user.customer.role_id != 2
      redirect_to home_path
    end
    @pagy ,@mentor_course = pagy(Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id),items: 3)
    @pagy, @ref_article =  pagy(Article.joins(:course_articles).where('course_id is null').order(:created_at),items: 6)

  end
  def new
  end

  def show
    render_wizard
  end

  def update
    @course.assign_attributes course_params
    if @course.save
      jump_to(next_step, course_id: @course.id)
    else
      render_wizard
    end

    if step == :new
      jump_to(step, course_id: @course.id)
    end

    render_wizard
  end
  private
  def course_params
    params.require(:course).permit!
  end

  def load_course
    if step == :over_view
      @course = Course.new
    else
      @course = Course.find_by id: params[:course_id]
      # @course.articles.build
    end
  end

end
