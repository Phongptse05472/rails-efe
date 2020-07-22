class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :left_side_data
  helper_method :devise_current_user

  def devise_current_user
    @devise_current_user ||= warden.authenticate(scope: :user)
  end

  def current_user
    if params[:user_id].blank?
      devise_current_user
    else
      User.find(params[:user_id])
    end
  end

  private

  def left_side_data
    #mentor
    #admin
    @data = Topic.select(:name, :id).limit(5)
  end
end
