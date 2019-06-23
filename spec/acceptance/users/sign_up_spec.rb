require 'rails_helper'

feature 'Sign up', %q{
  As a guest I should be able to sign up with name, email and password.
} do

  scenario 'User try sign up' do

    visit new_user_registration_path

    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: 'email@email.ru'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page.current_path).to eq root_path
  end

  scenario "User try sign up with invalid attributes" do

    visit new_user_registration_path

    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_on 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Email is invalid"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end
