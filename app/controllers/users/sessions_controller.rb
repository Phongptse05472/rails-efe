  # frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  layout 'login'
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super

  end
  # POST /resource/sign_in
  def create
    super
    @current_user_id = current_user.id
    user = User.where(id: @current_user_id )
    @customer = Customer.where(user_id: @current_user_id)
    if !@customer.exists?
      @customer = Customer.create(user_id: @current_user_id, role_id: 3, name: user.first.email )
    else
      @status = false
    end
  end


  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
