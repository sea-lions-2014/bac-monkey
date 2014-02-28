require 'spec_helper'

describe CaffeineCalc do
  context "#mg_series" do
    args = {milligrams: 200, hours: 0.5}

    it "returns a nested array" do
      expect(CaffeineCalc.mg_series(args).class).to eq Array
      expect(CaffeineCalc.mg_series(args).pop.class).to eq Array
    end

    it "returns results with no negative numbers" do
      results = CaffeineCalc.mg_series(args)
      results.each do |result|
        expect(result.first).to  be >= 0
        expect(result.last).to be >= 0
      end
    end

    it "correctly estimates the mg of a person who drank 200 mg over 1/2 hour after 2 hours" do
      results = CaffeineCalc.mg_series(args)
      expect(results[8].last).to be > 166
      expect(results[8].last).to be < 175
    end

    it "BAC eventually reverts to 0" do
      results = CaffeineCalc.mg_series(args)
      expect(results.last.last).to eq 0
    end
  end
end