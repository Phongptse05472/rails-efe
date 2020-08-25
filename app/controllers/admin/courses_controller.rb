class Admin::CoursesController < Admin::AdminController

  def index
    if current_user.customer.role_id != 1
      redirect_to home_path
    end
    @course = if params[:q].present?
                params[:q].to_i != 0 ? Course.by_id(params[:q]) : Course.search_list(params[:q])
              else
                Course.all
              end
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

