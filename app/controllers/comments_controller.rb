class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    respond_to do |format|
      if comment.save
        format.html { redirect_to comment.post, notice: 'Comment được tạo thành công' }
        format.js { render js: 'window.top.location.reload(true);' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
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