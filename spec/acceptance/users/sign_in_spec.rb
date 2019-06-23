require 'rails_helper'

feature 'Sign in', %q{
  As a guest I should be able to sign in with email and password.
} do

  let!(:user) { create(:user) }

  scenario 'User try sign in' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page.current_path).to eq root_path
  end

  scenario "User try sign in with invalid attributes" do

    visit new_user_session_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_on 'Log in'

    expect(page).to have_content "Log in"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
