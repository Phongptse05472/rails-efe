# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super

  end

  # POST /resource/sign_in
  def create
    super
    @current_user_id = current_user.id
    @customer = Customer.where(user_id: @current_user_id, role_id: 3)
    if !@customer.exists?
    else
      @customer = Customer.create(id: @current_user_id ,user_id: @current_user_id, role_id: 3)

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
