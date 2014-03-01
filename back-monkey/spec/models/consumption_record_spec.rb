require 'spec_helper'

describe ConsumptionRecord do
  it { should belong_to :user }

  context '#dose_description' do
    let(:record) { FactoryGirl.create :consumption_record }
    it "returns a string" do
      expect(record.dose_description.class).to eq String
    end
  end
end