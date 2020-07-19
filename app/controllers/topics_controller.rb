class TopicsController < ApplicationController
  before_action :set_topic


  def index
    @topic = Topic.all
  end

  def show
    @courses = Course.joins(:topics).where('topics.id = ?' , params[:id])
    # @courses = Shop.joins(user: :address).where(addresses: { state_id: 123456 })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

end
