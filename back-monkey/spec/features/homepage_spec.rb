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

    it "can't be submitted with invalid data" do
      fill_in 'alcohol_calc_weight', with: 175
      fill_in 'alcohol_calc_drinks', with: 'lots'
      fill_in 'alcohol_calc_hours', with: 4
      expect(page).to_not have_content('#chart')
    end

    it "can be submitted to create a chart with valid data" do
      fill_in 'alcohol_calc_weight', with: 175
      fill_in 'alcohol_calc_drinks', with: 4
      fill_in 'alcohol_calc_hours', with: 4
      click_on 'Calculate BAC'
      expect(page).to_not have_content('#chart')
    end

  end
end