class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def check_authentication
    redirect_to root_path if current_user.blank?
  end

  def login(user)
    session[:id] = user.id
  end

  helper_method :current_user
end