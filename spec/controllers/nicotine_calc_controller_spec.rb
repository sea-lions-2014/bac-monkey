require 'spec_helper'

describe NicotineCalcController do
  let!(:args){{cigarettes: 4, hours: 2, save: true}}
  let!(:user) { create :user }

  context '#create' do

    before :each do
      stub_current_user user
      post :create, nicotine_calc: args
    end

    it "creates a nicotine series from data" do
      expect(assigns(:nicotine_series)).to_not be_nil
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it "increments the current user's relevant substance total" do
      expect(user.reload.total_nicotine).to eq 4
    end
  end
end