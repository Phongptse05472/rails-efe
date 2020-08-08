class TopicsController < ApplicationController
  before_action :set_topic, only: [:index, :show]
  before_action :authenticate_user!, except: [:show]

  def index
    @topic = Topic.all
  end

  def show
    @courses = Course.joins(:topics).where('topics.id = ?' , @topic)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.friendly.find(params[:slug])
  end

end
