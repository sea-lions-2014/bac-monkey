require 'spec_helper'

describe MgOfCaffeine do
  context "#caffeine_content" do
    it "returns the correct mg of caffeine for 1 cup of coffee" do
      expect(MgOfCaffeine.caffeine_content("coffee", 1)).to eq 96
    end

    it "returns the correct mg of caffeine for 1 cup of tea" do
      expect(MgOfCaffeine.caffeine_content("tea", 1)).to eq 24
    end
  end
end