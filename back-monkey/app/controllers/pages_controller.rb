class PagesController < ApplicationController
  def index
    @gender = current_user ? current_user.gender : "m"
    @weight = current_user ? current_user.weight : ""
  end
end