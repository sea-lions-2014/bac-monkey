class UsersController < ApplicationController
  before_filter :check_authentication, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to root_path
    else
      redirect_to new_user_path, notice: "That username or email address is already registered."
    end
  end

  def show
    @history = current_user.past_week_consumption
  end

end
