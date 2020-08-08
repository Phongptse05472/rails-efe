class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save

  end

  def update
    @update_comment = Comment.find_by(id: params[:id], customer_id: current_user.id)
    @update_comment.update(is_print: true)

  end
  private

  def comment_params
    params.require(:comment).permit(:customer_id, :article_id, :content)
  end


end