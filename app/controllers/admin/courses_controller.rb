class Admin::CoursesController < Admin::AdminController

  def index
    if current_user.customer.role_id != 1
      redirect_to home_path
    end
    @course = Course.all.order(created_at: :desc)
    @pagy, @course_paging = pagy(@course, items: 10)
  end

  def deactivate_course
    @course_disable = Course.friendly.find(params[:slug])
    @course_disable.update(is_active: !@course_disable.is_active)
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end


end

