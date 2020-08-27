class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @comment = Comment.new(comment_params)
    @comment.save

  end

  def update
    @update_comment = Comment.find_by(id: params[:id])
    @current_comment_pin = Comment.where(" article_id = ? AND is_pin = true", @update_comment.article_id)
    if !@current_comment_pin.blank?
      @current_comment_pin.update_all is_pin: false
    end
    @update_comment.update_attribute("is_pin", !@update_comment.is_pin)

    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :article_id, :content)
  end


end