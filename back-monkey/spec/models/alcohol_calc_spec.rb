require 'spec_helper'

describe AlcoholCalc do
  context "#bac_series" do
    args = {alcohol: 1.8, weight: 160, gender: "m", hours: 1}

    it "returns a nested array" do
      expect(AlcoholCalc.bac_series(args).class).to eq Array
      expect(AlcoholCalc.bac_series(args).pop.class).to eq Array
    end

    it "returns results with no negative numbers" do
      results = AlcoholCalc.bac_series(args)
      results.each do |result|
        expect(result.first).to  be >= 0
        expect(result.last).to be >= 0
      end
    end

    it "correctly estimates the BAC of a 160 lb man who drank 3 shots over 1 hour" do
      results = AlcoholCalc.bac_series(args)
      expect(results[4].last).to be > 0.05
      expect(results[4].last).to be < 0.07
    end

    it "BAC eventually reverts to 0" do
      results = AlcoholCalc.bac_series(args)
      expect(results.last.last).to eq 0
    end
  end
end