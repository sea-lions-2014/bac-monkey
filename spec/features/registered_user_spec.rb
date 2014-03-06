require 'spec_helper'

describe "a registered user", js:true do
  let!(:user) {create :user}

  context "signing in" do
    before :each do
      visit root_path
    end

    it "a user should be able to sign in" do
      login_as user
      expect(page).to have_content 'Profile'
    end
  end

  context "a logged in user" do
    before :each do
      login_as user
    end

    it "should have default values filled in for a logged in user" do
      expect(find('#alcohol_calc_weight').value).to eq user.weight.to_s
      expect(find('#alcohol_calc_gender').value).to eq 'f'
    end
  end

  context "profile" do
    before :each do
      login_as user
      click_link 'Profile'
    end

    it "should list the user's total consumption" do
      expect(page).to have_content 'C2H5OH'
      expect(page).to have_content 'C8H10N4O2'
      expect(page).to have_content 'C10H14N2'
      expect(page).to have_content 'Drugs this week'
    end
  end

  context "sign out" do
    it "should sign out a user" do
       login_as user
       click_link 'Sign Out'
       expect(current_path).to eq root_path
    end
  end

  context "profile page displays functional home button" do
    before :each do
      login_as user
      click_link 'Profile'
    end

    it "redirects to home page" do
      click_link 'Home'
      expect(current_path).to eq root_path
    end

    it "does not have a profile button" do
      expect(page).not_to have_content 'Profile'
    end

    it "displays a home button" do
      expect(page).to have_content 'Home'
    end

  end

  context "navigation" do
    before :each do
      login_as user
    end

    it "clicking the profile button should go to a user's profile" do
      visit root_path
      click_link 'Profile'
      expect(current_path).to eq user_path user
    end

    it "clicking the monkey should take you to the home page" do
      find('#topbar img').click
      expect(current_path).to eq root_path
    end

  end
end