class TopicsController < ApplicationController
  before_action :set_group, only: [:index, :show]
  before_action :authenticate_user!, except: [:show]

  def index
    @topic = Group.all
  end

  def show

    @pagy , @courses = pagy(Course.joins(:groups).where('groups.slug = ?' , @topic.slug),item: 5)

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @topic = Group.friendly.find(params[:slug])
  end

end
