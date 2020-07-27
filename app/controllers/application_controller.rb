class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action  :left_side_data

  private
  def left_side_data
    if !current_user.present?
      @data = Topic.select(:name, :id).limit(5)
    else
      @my_courses = Course.select(:name, :id).where('customer_id = ?', current_user.id).limit(5)
    end
  end
end
