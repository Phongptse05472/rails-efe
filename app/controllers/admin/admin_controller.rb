class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_admin! # Tell devise to use :admin map
  layout 'admin'

  # @admin = Customer.where("id = ?", current_user.id)
    # if  !@admin.blank?
    #   redirect_to home_path
    # else
    #
    # end


end