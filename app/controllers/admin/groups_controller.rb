class Admin::GroupsController < Admin::AdminController
  def index
    if current_user.customer.role_id != 1
      redirect_to home_path
    end
    @group = if params[:q].present?
                params[:q].to_i != 0 ? Course.by_id(params[:q]) : Group.search_list(params[:q])
              else
                Group.all
              end
    @pagy, @group_paging = pagy(@group, items: 10)
  end

end
