require 'spec_helper'

describe NicotineCalc do
  context "#series" do
    args = {milligrams: 2, hours: 0.5}
    let(:niccalc) { NicotineCalc.new(args) }

    it "returns a nested array" do
      expect(niccalc.series.class).to eq Array
      expect(niccalc.series.pop.class).to eq Array
    end

    it "returns results with no negative numbers" do
      results = niccalc.series
      results.each do |result|
        expect(result.first).to  be >= 0
        expect(result.last).to be >= 0
      end
    end

    it "correctly estimates the mg of a person who smoked 2 mg over 1/2 hour after 2 hours" do
      results = niccalc.series
      expect(results[8].last).to be > 1.1
      expect(results[8].last).to be < 1.4
    end

    it "BAC eventually reverts to 0" do
      results = niccalc.series
      expect(results.last.last).to eq 0
    end
  end
end