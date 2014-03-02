class SessionsController < ApplicationController

  def create
    user = User.find_by_user_name(params[:user][:user_name])
    if user.authenticate(params[:user][:password])
      login(user) 
      redirect_to user_path(user)
    else
      flash.notice = "That username or password is invalid."
      render 'users/_sign_in_form'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end