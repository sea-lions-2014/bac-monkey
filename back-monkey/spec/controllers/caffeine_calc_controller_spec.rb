require 'spec_helper'

describe CaffeineCalcController do
  let!(:args){{cups: 2, hours: 2, type: 'coffee'}}
  context '#create' do

    before :each do
      post :create, caffeine_calc: args
    end

    it "creates a caffeine series from data" do
      expect(assigns(:caffeine_series)).to be
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

  end
end