class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :left_side_data

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def  logged_in?
    !!current_user.present?
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  private

  def left_side_data
    #mentor
    #admin
    @data = Group.select(:name, :slug).limit(5)
    if logged_in?
      @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? ', current_user.id).limit(5)
    else
      @my_courses = nil
    end

  end
end
