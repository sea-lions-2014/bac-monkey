class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:user][:user_name]
    user = User.find(:first, :conditions => ["lower(user_name) = ?", username.downcase])
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