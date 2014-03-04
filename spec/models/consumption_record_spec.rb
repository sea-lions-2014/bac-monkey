require 'spec_helper'

describe ConsumptionRecord do
  it { should belong_to :user }

  context '#dose_description' do
    let(:caff_record) { FactoryGirl.create :consumption_record }
    let(:drink_record) { FactoryGirl.create :single_drink }

    it "returns a string" do
      expect(caff_record.dose_description.class).to eq String
    end
  end

  context '#update_user_total' do
    let!(:user) { FactoryGirl.create :user }
    it "increments the associated user's substance total when saved" do
      expect {
        user.consumption_records.create(substance: "caffeine", amount: 200, unit_of_measure: "mg")
      }.to change { user.reload.total_caffeine }.by(200)
    end
  end
end