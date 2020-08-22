class Mentor::CoursesController < Mentor::MentorController
  # before_action :set_course
  def index
    if current_user.customer.role_id != 2
      redirect_to home_path
    end
    @pagy ,@mentor_course = pagy(Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id),items: 3)

    @pagy, @ref_article =  pagy(Article.joins(:course_articles).where('course_id is null').order(:created_at),items: 6)

  end
  def new
  end

end
