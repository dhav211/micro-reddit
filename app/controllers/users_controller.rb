class UsersController < ApplicationController
  def create
    user = User.new(name: params[:username])

    if user.save
      session[:user_id] = user.id
      redirect_to posts_path
    end
  end
end
