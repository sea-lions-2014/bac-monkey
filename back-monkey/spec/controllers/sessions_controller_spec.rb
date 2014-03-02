require 'spec_helper'

describe SessionsController do

  context "#create" do
    let!(:user) { create :user }

    it "should create a session given valid credentials" do
      post :create, user: attributes_for(:user)
      expect(session[:id]).to eq user.id
    end

    it "should not create a session if credentials are invalid" do
      post :create, user: {user_name: user.user_name, password: ''}
      expect(session[:id]).to be nil
    end
  end

  context "#destroy" do
    let!(:user) { create :user }

    it "should destroy a session" do
      session[:id] = user.id
      delete :destroy, id: user.id
      expect(session[:id]).to be nil
    end

  end  
  
end