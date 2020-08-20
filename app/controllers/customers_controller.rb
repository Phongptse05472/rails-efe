class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
   @customer =  Customer.select("customers.*, users.*").joins(:user).where("user_id = ?", current_user.id)
   end

  def edit
     @customer =  Customer.where("user_id = ?", current_user.id)
  avatar_link = params[:img_link]
  name = params[:name]
  phone = params[:phone_number]
  binding.pry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by(params[:current_user_id])
    end

      def customer_params
        params.require(:customer).permit(name, phone, avatar_link)
      end

end
