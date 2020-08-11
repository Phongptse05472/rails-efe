class Mentor::CoursesController < Mentor::MentorController
  # before_action :set_course
  def index

    # @mentor_course = Course.select("courses.*, customer_courses.*, customers.*").joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true AND customers.role_id = 2', current_user.id)
    @mentor_course = Course.joins(:customer_courses).joins(:customers).where('customers.id = ? AND customer_courses.is_owner = true', current_user.id)

    @ref_article =  Article.left_outer_joins(:course_articles).where('course_id is null').order(:created_at).limit(6)

  end
  def new
  end

end
