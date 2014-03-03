require 'spec_helper'

describe UsersController do

  context '#new' do
    it "initializes an empty User object" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  context '#create' do
    let!(:user) { build :user }
    let!(:non_user) { build :non_user }

    it "creates a user given valid info" do
      post :create, user: attributes_for(:user)
      expect(assigns(:user).save).to be true
    end

    it "does not create a user given invalid info" do
      post :create, user: attributes_for(:non_user)
      expect(assigns(:user).save).to be false
    end
  end

  context '#show' do
    let!(:user){ create :user }

    it "should find the current logged in user" do
      session[:id] = user.id
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end

    it "should require the user to be logged in" do
      session[:id] = nil
      get :show, id: user.id
      expect(assigns(:user)).to be nil
    end

  end
end
