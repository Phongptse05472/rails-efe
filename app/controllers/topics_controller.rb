class TopicsController < ApplicationController
  before_action :set_topic


  def index
    @topic = Topic.all
  end

  def show
    @courses = Course.where(topic_id: params[:id] )
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id]) rescue nil
  end
end
