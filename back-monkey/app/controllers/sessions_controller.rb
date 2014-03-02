class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email_or_user_name(params[:user][:user_name])
    login(user) if user.authenticate([params[:user][:password]])
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end