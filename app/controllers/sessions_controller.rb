class SessionsController < ApplicationController
  respond_to :json, only: [:create]
  def create
    username = params[:user][:user_name]
    user = User.find(:first, :conditions => ["lower(user_name) = ?", username.downcase]) || User.find(:first, :conditions => ["lower(email) = ?", username.downcase])
    if user && user.authenticate(params[:user][:password])
      login(user)
      render json: current_user.id
    else
      # render json: '/users/sign_in_error', :layout => false
      render partial: '/users/sign_in_error', :status => :unprocessable_entity
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end