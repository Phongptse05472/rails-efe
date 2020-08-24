class Admin::CustomersController < Admin::AdminController


  def index
    if current_user.customer.role_id != 1
    redirect_to home_path
    end
    @account = if params[:q].present?
                Customer.search_list(params[:q])
              else
                Customer.all
              end.select("customers.*, users.* ").joins(:user).all.where("role_id = 2 OR role_id = 3")   
    @pagy, @customer_paging = pagy(@account, items: 10)
  end

    def deactivate
    @customer_disable = User.find(params[:id])
    @customer_disable.update(is_active: !@customer_disable.is_active)
     respond_to do |format|
        format.js {render inline: "location.reload();" }
        end
    end

end