class Admin::CustomersController < Admin::AdminController


  def index
    # if @admin.blank?
    # redirect_to home_path
    # end
    @customer = Customer.select("customers.*, users.* ").joins(:user).all
    @pagy, @customer_paging = pagy(@customer, items: 10)
  end

    def deactivate
    @customer_disable = User.find(params[:id])
    @customer_disable.update(is_active: !@customer_disable.is_active)
     respond_to do |format|
        format.js {render inline: "location.reload();" }
        end
    end

end