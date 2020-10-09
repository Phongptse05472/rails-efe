class Mentor::CoursesController < Mentor::MentorController
  include Wicked::Wizard
  before_action :load_course, except: :index
  steps :landing_page, :create_content, :over_view

  def index
    if session[:course_id] != nil
      session[:course_id] = nil
    end
    @pagy ,@mentor_course = pagy(Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id).order(created_at: :desc), items: 5)
    
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
      @course.id = Course.last.id.next unless @course.id
      @course.author = current_user.id
      session[:course_id] = @course.id
      begin
        render_wizard @course
      rescue
        flash[:error] = @course.errors.full_messages
      end
    else
      los = []
      @course.articles.each do |article| 
        article.los.each do |lo|
          los << lo.id
        end
      end
      @course.duration += ('%.2f' % (params[:article_duration].to_f / 360 )).to_f
      los = los.uniq
      @course.lo = los.join(";")   
      if step.to_sym == :create_content
        if @course.save
          redirect_to wizard_path(:create_content)
        else
          flash[:error] = @course.errors.full_messages
        end
      end
    end
  end

  private
  def course_params
    params.require(:course).permit!
  end

  def load_course
    if session[:course_id].nil? && step.to_sym != :landing_page
      redirect_to wizard_path(:landing_page)
    elsif step.to_sym == :landing_page && session[:course_id].nil?
        @course = Course.new
    elsif !session[:course_id].nil?
      @course = Course.find_by id: session[:course_id]
      if @course.nil?
        redirect_to mentor_courses_path
      end
    else
      @course = Course.find_by slug: params[:id]
    end
  end
end
