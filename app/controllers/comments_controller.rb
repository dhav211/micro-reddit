class CommentsController < ApplicationController
  def show
    kill
  end

  def create
    current_user ||= User.find session[:user_id] if session[:user_id]
    @new_comment = Comment.new allowed_params
    @new_comment.post = Post.find_by id: params[:comment][:post_id]
    @new_comment.user = current_user

    redirect_to @new_comment.post if @new_comment.save
  end

  private

  def allowed_params
    params.require(:comment).permit(:text, :user, :post)
  end
end
