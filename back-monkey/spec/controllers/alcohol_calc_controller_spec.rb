require 'spec_helper'

describe AlcoholCalcController do
  let!(:args){{weight: 200, gender: "m", hours: 2, alcohol: 4}}
  context '#create' do

    before :each do
      post :create, params: args
    end

    it "creates a BAC series from data" do
      expect(assigns(:bac)).to be
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

  end
end