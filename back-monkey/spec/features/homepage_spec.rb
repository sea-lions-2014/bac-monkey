require 'spec_helper'

describe "homepage" do
  before :each do
    visit root_path
  end

  context "welcome screen" do
    it "has a welcome message" do
      expect(page).to have_css '#welcome_msg'
    end

    it "does not have a chart" do
      expect(page).to_not have_css '#chart'
    end
  end

  context "BAC form" do
    it "has a form for entering information" do
      expect(page).to have_content 'form'
    end

    it "can't be submitted with incomplete information" do
      expect(find('submit')[:disabled]).to eq 'disabled'
    end

    # it "can't be submitted with invalid data" do
    #   fill_in 'weight', with: 175
    #   choose 'gender_m'
    #   fill_in 'alcohol', with: 'lots'
    #   fill_in 'hours', with: 4
    #   expect(page).to have_css 'commit'
    # end

    # it "can be submitted with valid data" do
    #   fill_in 'weight', with: 175
    #   choose 'gender_m'
    #   fill_in 'alcohol', with: 4
    #   fill_in 'hours', with: 4
    #   click_on 'find BAC'
    #   expect(page).to have_css '#chart'
    # end

    # it "generates a chart when proper data is submitted" do
    #   fill_in 'weight', with: 175
    #   choose 'gender_m'
    #   fill_in 'alcohol', with: 4
    #   fill_in 'hours', with: 4
    #   click_on 'find BAC'
    #   expect('chart').to be
    # end

  end
end