require 'spec_helper'

describe User  do
  context "User model" do
    let(:person){create :user}
    let(:not_user){build :non_user}
    let(:empty_params){build :empty_params}

    it "creates a new user" do
      expect(person).to be_a User
    end

    it "rejects when fields are left empty" do
      expect(empty_params.valid?).to be false
    end

    it "rejects an invalid email address" do
      expect(not_user.save).to eq false
    end

    it "encrypts a password" do
      expect(person.password_hash).to_not eq "password"
      expect(not_user.password_hash).to eq "password"
    end
  end
end