class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  @admin = Customer.where("user_id = ?", current_user.id)
    # if  !@admin.blank?
    #   redirect_to home_path
    # else
    #
    # end


end