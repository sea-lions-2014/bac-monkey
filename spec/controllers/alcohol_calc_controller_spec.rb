require 'spec_helper'

describe AlcoholCalcController do
  let!(:alcohol_calc){{weight: 200, gender: "m", hours: 2, drinks: 4, save: true}}
  let!(:user) { create :user }

  context '#create' do
    before :each do
      stub_current_user user
      post :create, alcohol_calc: alcohol_calc
    end

    it "creates a BAC series from data" do
      expect(assigns(:bac)).to_not be_nil
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it "increments the current user's relevant substance total" do
      expect(user.reload.total_alcohol).to eq 4
    end
  end
end