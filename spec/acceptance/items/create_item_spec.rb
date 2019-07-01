require 'rails_helper'

feature 'Create item menu', %q{
  As a Lunches Admin, I can add items in menu only for today by adding a name and
  price.
} do

  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  scenario 'Admin try add item menu' do
    sign_in(admin)
    visit admin_items_path

    click_on 'New'
    fill_in 'Name', with: 'Name item'
    fill_in 'Course type', with: '0'
    fill_in 'Price', with: '9.99'
    click_on 'Create'

    expect(page).to have_content 'Your item successfully created.'
    expect(page).to have_content 'Name item'
    expect(page).to have_content '9.99'
  end

  scenario 'User try add item menu' do
    sign_in(user)

    visit admin_items_path

    expect(page).to have_content 'You are not authorized to view this page.'
  end

  scenario "Admin try add item menu with invalid attributes" do
    sign_in(admin)
    visit admin_items_path

    click_on 'New'
    fill_in 'Name', with: ''
    fill_in 'Course type', with: ''
    fill_in 'Price', with: ''
    click_on 'Create'

    expect(page).to have_content "can't be blank"
  end
end
