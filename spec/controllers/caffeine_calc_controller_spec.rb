require 'spec_helper'

describe CaffeineCalcController do
  let!(:args){{cups: 8, hours: 2, type: 'coffee', save: true}}
  let!(:user) { create :user }

  context '#create' do

    before :each do
      ApplicationController.any_instance.stub(:current_user) { user }
      post :create, caffeine_calc: args
    end

    it "creates a caffeine series from data" do
      expect(assigns(:caffeine_series)).to be
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it "increments the current user's relevant substance total" do
      expect(user.reload.total_caffeine).to eq 768
    end
  end
end