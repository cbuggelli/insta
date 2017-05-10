class CommentsController < ApplicationController
  before_action :require_login

  # @comments = Comment.all

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.picture_id = params[:picture_id]
    @comment.save
    redirect_to picture_path(@comment.picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
