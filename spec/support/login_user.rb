module LoginUser
  def login_as(user)
    visit root_path
    click_link 'Sign In'
    fill_in 'user[user_name]', with: user.user_name
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'
  end

  def stub_current_user(user)
    ApplicationController.any_instance.stub(:current_user) { user }
  end
end