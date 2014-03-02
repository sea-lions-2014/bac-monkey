require 'spec_helper'

describe UsersController do

  context '#new' do
    it "initializes an empty User object" do
      get :new
      expect(assigns(:user)).to be_a User
    end
  end

  context '#create' do
    let!(:user) {build :user}
    it "creates a user given valid info" do
      post :create, user: attributes_for(:user)
      expect(assigns(:user).save).to be true
    end
  end

  context '#show' do
    let!(:current_user){ create :user }
    
    before :each do
      get :show, id: current_user.id
    end

    it "should return the current user" do
      p assigns(:user)
      expect(assigns(:user)).to eq current_user
    end

  end
end