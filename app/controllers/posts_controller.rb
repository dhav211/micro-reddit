class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    @new_post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.all
    @new_comment = Comment.new
  end

  def create
    current_user ||= User.find session[:user_id] if session[:user_id]
    @new_post = Post.new allowed_params
    @new_post.user = current_user

    redirect_to @new_post if @new_post.save
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :url, :user)
  end
end
