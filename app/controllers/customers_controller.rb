class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  # GET /customers/1
  # GET /customers/1.json
  def show
  @customer =  Customer.select("customers.*, users.*").joins(:user).where("user_id = ?", current_user.id)
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def edit
#         post.update_attributes(params[:avatar])

  end


    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by(params[:current_user_id])
    end

end
