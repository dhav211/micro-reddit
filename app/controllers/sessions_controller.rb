class SessionsController < ApplicationController
  def create
    user = User.find_by name: params[:username]

    unless user.nil?
      session[:user_id] = user.id
      redirect_to posts_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end
end
