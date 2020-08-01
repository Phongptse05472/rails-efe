class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :left_side_data

  private

  def left_side_data
    #mentor
    #admin
    @data = Topic.select(:name, :slug).limit(5)
    if current_user.present?
      @my_courses = Course.select("courses.*, customer_courses.*").joins(:customer_courses).where('customer_id = ? ', current_user.id).limit(5)
    else
      @my_courses = nil
    end

  end
end
