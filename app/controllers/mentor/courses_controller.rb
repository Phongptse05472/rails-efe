class Mentor::CoursesController < Mentor::MentorController
  # before_action :set_course
  def index

    # @mentor_course = Course.select("courses.*, customer_courses.*, customers.*").joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true AND customers.role_id = 2', current_user.id)
    @pagy ,@mentor_course = pagy(Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id),items: 3)

    @pagy, @ref_article =  pagy(Article.joins(:course_articles).where('course_id is null').order(:created_at),items: 6)

  end
  def new
  end

  def show

  end

end
