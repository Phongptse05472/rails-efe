class Admin::CoursesController < Admin::AdminController

  def index
    # if @admin.blank?
    #   redirect_to home_path
    # end
    @course = Course.all.order(created_at: :desc)
    @pagy, @course_paging = pagy(@course, items: 10)
  end

  def show

  end

  def update

  end

  private
end

