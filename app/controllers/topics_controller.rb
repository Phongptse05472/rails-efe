class TopicsController < ApplicationController
  before_action :set_topic


  def index
    @topic = Topic.all
  end

  def show
    @topic_slug = Topic.friendly.find(params[:slug])
    @courses = Course.joins(:topics).where('topics.id = ?' , @topic_slug.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.friendly.find(params[:slug])
  end

end
