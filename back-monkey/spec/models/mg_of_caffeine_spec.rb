require 'spec_helper'

describe MgOfCaffeine do
  context "#coffee" do
    it "returns the correct mg of caffeine for 8 oz of coffee" do
      expect(MgOfCaffeine.coffee(1)).to eq 96
    end
  end

  context "#tea" do
    it "returns the correct mg of caffeine for 8 oz of tea" do
      expect(MgOfCaffeine.tea(1)).to eq 24
    end
  end
end