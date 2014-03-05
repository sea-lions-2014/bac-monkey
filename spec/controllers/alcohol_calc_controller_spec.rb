require 'spec_helper'

describe AlcoholCalcController do
  let!(:alcohol_calc){{weight: 200, gender: "m", hours: 2, drinks: 4, save: true}}
  let!(:user) { create :user }

  context '#create' do
    before :each do
      ApplicationController.any_instance.stub(:current_user) { user }
      post :create, alcohol_calc: alcohol_calc
    end

    it "creates a new AlcoholCalc instance" do
      expect(assigns(:alcohol_calc)).to be_a AlcoholCalc
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it "increments the current user's relevant substance total" do
      expect(user.reload.total_alcohol).to eq 4
    end
  end
end