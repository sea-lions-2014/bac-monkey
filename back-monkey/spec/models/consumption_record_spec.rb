require 'spec_helper'

describe ConsumptionRecord do
  it { should belong_to :user }

  context '#dose_description' do
    let(:caff_record) { FactoryGirl.create :consumption_record }
    let(:drink_record) { FactoryGirl.create :single_drink }
    it "returns a string" do
      expect(caff_record.dose_description.class).to eq String
    end

    it "should return the correct description" do
      expect(caff_record.dose_description). to eq "200 mgs"
    end

    it "should return the unit of measure in the singular if amount is 1" do
      expect(drink_record.dose_description).to eq "1 drink"
    end
  end
end