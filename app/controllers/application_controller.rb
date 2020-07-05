class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # protect_from_forgery with: :exception
  # around_action :set_locale_from_url
  def index
    render template: 'application'
  end

end
