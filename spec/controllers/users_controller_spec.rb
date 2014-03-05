require 'spec_helper'

describe UsersController do

  context '#new' do
    it "initializes an empty User object" do
      get :new
      expect(assigns(:user)).to be_a User
    end
  end

  context '#create' do
    let!(:user) { build :user }
    let!(:non_user) { build :non_user }

    it "creates a user given valid info" do
      expect{post :create, user: attributes_for(:user)}.to change{User.count}.by(1)
    end

    it "does not create a user given invalid info" do
      expect{post :create, user: attributes_for(:non_user)}.to_not change{User.count}
    end
  end

  context '#show' do
    let!(:user){ create :user }

    it "should require the user to be logged in" do
      session[:id] = nil
      get :show, id: user.id
      expect(assigns(:user)).to be nil
    end

  end
end