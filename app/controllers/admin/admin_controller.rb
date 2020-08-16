class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'


  # @admin = User.where("id = ? AND role = ? ", current_user.id , 1)
  #   if  @admin.blank?
  #     redirect_to home_path
  #   else
  #
  #   end


end