class Mentor::MentorController < ApplicationController
  before_action :authenticate_user!
  before_action :check_metor_account

  private
  def check_metor_account
    if current_user.customer.role_id != 2
      redirect_to home_path
    end
  end
end