require 'spec_helper'

describe OuncesOfAlcohol do
  context "#alcohol_content" do

  it "returns .6 ounces for 1 drink" do
    expect(OuncesOfAlcohol.beer(1)).to eq 0.6
    expect(OuncesOfAlcohol.wine(1)).to eq 0.6
    expect(OuncesOfAlcohol.liquor(1)).to eq 0.6
   end

   it "returns correct ounces of alcohol for a custom drink input" do
    expect(OuncesOfAlcohol.alcohol_content(2, 10.0, 1)).to eq (20)
   end
  end
end