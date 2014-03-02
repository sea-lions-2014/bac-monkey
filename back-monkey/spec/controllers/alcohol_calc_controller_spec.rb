require 'spec_helper'

describe AlcoholCalcController do
  let!(:alcohol_calc){{weight: 200, gender: "m", hours: 2, drinks: 4}}

  context '#create' do
    before :each do
      post :create, alcohol_calc: alcohol_calc
    end

    it "creates a new AlcoholCalc instance" do
      expect(assigns(:alcohol_calc)).to be_a AlcoholCalc
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end
  end
end