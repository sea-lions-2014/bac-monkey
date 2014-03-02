class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_user_name(params[:user][:user_name])
    if user.authenticate(params[:user][:password])
      login(user) 
      redirect_to user_path(user)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end