class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
      if comment.save
        ActionCable.server.broadcast "comment_channel"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :article_id, :content)
  end


end