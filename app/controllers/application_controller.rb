class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :left_side_data

  def logged_in?
    !!current_user.present?
    # redirect_to request.referrer
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to user_home_path
    else
      @user = Customer.where("id = ?", current_user.id)
      # if @user.first.role_id == 1
      #   redirect_to home_path
      # elsif @user.first.role_id == 2
      #   redirect_to mentor_courses_path
      # else
      #   redirect_to admin_customers_path
      binding.pry
      if @user.first.role_id == 1
        redirect_to "/admin/customers"
      else
        redirect_to mentor_courses_path
      end

      #
    end
  end

  private

  def left_side_data
    #mentor
    #admin
    @data = Group.select(:name, :slug).limit(5)
    if logged_in?
      @left_course = CustomerCourse.select("courses.*, customer_courses.*").joins(:course).where('customer_id = ? AND customer_courses.enrollment_date IS NOT null', current_user.id).order(updated_at: :desc).limit(5)
    else
      @left_course = nil
    end

  end
end
