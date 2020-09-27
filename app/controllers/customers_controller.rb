class CustomersController < ApplicationController
skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update]
  # GET /customers/1
  # GET /customers/1.json
  def show
   @customer =  Customer.select("customers.*, users.*").joins(:user).where("user_id = ?", current_user.id)
   end

   def update_img
    @customer = Customer.where("user_id = ?", current_user.id)
    avatar = params[:avatar]
    @customer.update(avatar: avatar)
      respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
   end

  def edit
 @customer =Customer.where("user_id = ?", current_user.id)
  end


  def update
  @customer =Customer.where("user_id = ?", current_user.id)
    name = params[:name]
    phone = params[:phone_number]
    if params[:commit] == "Cancel"
        redirect_to "/profile"
        else
        @customer.update(name: name, phone_number: phone)
        redirect_to "/profile"
      end





  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by(params[:current_user_id])
    end

end
