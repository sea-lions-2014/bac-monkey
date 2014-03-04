require 'spec_helper'

describe User do
  context "User model" do
    let(:person){create :user}
    let(:not_user){build :non_user}
    let(:empty_params){build :empty_params}

    it { should have_many :consumption_records }

    it "creates a new user" do
      expect(person).to be_a User
    end

    it "rejects when fields are left empty" do
      expect(empty_params.valid?).to be false
    end

    it "rejects an invalid email address" do
      expect(not_user.save).to eq false
    end

    it "can match a password correctly" do
      expect(person.password_digest).to_not eq "pasword"
      expect(person.password_digest).to eq "password"
    end
  end

  context "daily average methods for one user" do
    let!(:user){ create :user }
    before :each do
      User.any_instance.stub(:total_alcohol) { 10 }
      User.any_instance.stub(:total_caffeine) { 1000 }
      User.any_instance.stub(:total_nicotine) { 100 }
      User.any_instance.stub(:created_at) { Time.zone.now - 864000 }
    end

    it "returns a daily average of alcohol consumption" do
      expect(user.daily_average_alcohol).to eq 1
    end

    it "returns a daily average of caffeine consumption" do
      expect(user.daily_average_caffeine).to eq 100
    end

    it "returns a daily average of nicotine consumption" do
      expect(user.daily_average_nicotine).to eq 10
    end
  end

  context "daily average methods for all users" do
    let!(:user){ create :user }
    let!(:user2){ create :user2 }

    before :each do
      user.consumption_records.create(substance: "alcohol", amount: 10)
      user.consumption_records.create(substance: "caffeine", amount: 10)
      user.consumption_records.create(substance: "nicotine", amount: 10)
      user2.consumption_records.create(substance: "alcohol", amount: 0)
      user2.consumption_records.create(substance: "caffeine", amount: 0)
      user2.consumption_records.create(substance: "nicotine", amount: 0)
    end

    it "returns a daily average of alcohol consumption" do
      expect(User.daily_average_alcohol).to eq 5
    end

    it "returns a daily average of caffeine consumption" do
      expect(User.daily_average_caffeine).to eq 5
    end

    it "returns a daily average of nicotine consumption" do
      expect(User.daily_average_nicotine).to eq 5
    end
  end

  context "daily comparison methods" do
    let!(:user){ create :user }
    let!(:user2){ create :user2 }

    before :each do
      user.consumption_records.create(substance: "alcohol", amount: 10)
      user.consumption_records.create(substance: "caffeine", amount: 10)
      user.consumption_records.create(substance: "nicotine", amount: 10)
      user2.consumption_records.create(substance: "alcohol", amount: 0)
      user2.consumption_records.create(substance: "caffeine", amount: 0)
      user2.consumption_records.create(substance: "nicotine", amount: 0)
    end

    it "returns comparative % alcohol consumption" do

      expect(user.reload.daily_comparison_alcohol).to eq 100
      expect(user2.reload.daily_comparison_alcohol).to eq -100
    end

    it "returns comparative % caffeine consumption" do
      expect(user.reload.daily_comparison_alcohol).to eq 100
      expect(user2.reload.daily_comparison_alcohol).to eq -100
    end

    it "returns comparative % nicotine consumption" do
      expect(user.reload.daily_comparison_alcohol).to eq 100
      expect(user2.reload.daily_comparison_alcohol).to eq -100
    end
  end
end