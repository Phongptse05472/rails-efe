class CommentController < ApplicationController
  def create

  end

  def edit

  end

  def destroy

  end

  def history

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    #comment
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
      #Article

    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
  end
end
