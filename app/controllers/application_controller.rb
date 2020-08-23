class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :left_side_data
  rescue_from Pagy::OverflowError, with: :redirect_to_last_page


  def logged_in?
    !!current_user.present?
  end


  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to home_path
    else
      redirect_to user_home_path
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

  def redirect_to_last_page(exception)
    redirect_to url_for(page: exception.pagy.last), notice: "Page ##{params[:page]} is overflowing. Showing page #{exception.pagy.last} instead."
    end
end
