require 'rails_helper'

feature 'Edit profile', %q{
  As a user I should be able to edit my profile.
} do

  let!(:user) { create(:user) }

  scenario 'User try edit profile' do
    sign_in(user)
    visit edit_user_registration_path

    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: "new@email.ru"
    fill_in 'Password', with: "new_password"
    fill_in 'Password confirmation', with: 'new_password'
    fill_in 'Current password', with: user.password
    click_on 'Update'

    expect(page.current_path).to eq root_path
  end

  scenario "User try edit profile with invalide attributes" do
    sign_in(user)
    visit edit_user_registration_path

    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: 'new_password'
    click_on 'Update'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Email is invalid"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Current password can't be blank"
  end
end
