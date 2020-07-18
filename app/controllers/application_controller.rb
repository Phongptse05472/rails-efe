class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :left_side_data

  private
    def left_side_data
      #mentor
      #admin
      @left_side_courses = Topic.select(:name).limit(5)
    end




end
