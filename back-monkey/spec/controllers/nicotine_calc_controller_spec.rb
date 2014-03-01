require 'spec_helper'

describe nicotineCalcController do
  let!(:args){{cigarettes: 4, hours: 2}}
  context '#create' do

    before :each do
      post :create, params: args
    end

    it "creates a nicotine series from data" do
      expect(assigns(:nicotine_series)).to be
    end

    it "returns a JSON object" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

  end
end