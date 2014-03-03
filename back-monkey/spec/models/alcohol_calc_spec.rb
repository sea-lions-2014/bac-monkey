require 'spec_helper'

describe AlcoholCalc do
  let(:args) { {alcohol: 1.8, weight: 160, gender: "m", hours: 1} }
  let(:alccalc) { AlcoholCalc.new(args) }

  context "#bac_series" do
    it "returns a nested array" do
      expect(alccalc.bac_series.class).to eq Array
      expect(alccalc.bac_series.pop.class).to eq Array
    end

    it "returns results with no negative numbers" do
      alccalc.bac_series.each do |result|
        expect(result.first).to  be >= 0
        expect(result.last).to be >= 0
      end
    end

    it "correctly estimates the BAC of a 160 lb man who drank 3 shots over 1 hour" do
      # we're using this in multiple tests, can we use let?
      results = alccalc.bac_series
      expect(results[4].last).to be > 0.05
      expect(results[4].last).to be < 0.07
    end

    it "BAC eventually reverts to 0" do
      results = alccalc.bac_series
      expect(results.last.last).to eq 0
    end
  end
end
