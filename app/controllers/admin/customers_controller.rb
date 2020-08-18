class Admin::CustomersController < Admin::AdminController


  def index
    # if @admin.blank?
    # redirect_to home_path
    # end
    @customer = Customer.select("customers.*, users.* ").joins(:user).all
  end
end