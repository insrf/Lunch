require 'rails_helper'

feature 'Admin can see users list', %q{
  As a Lunches Admin, I can browse registered users.
} do

  given(:admin) { create(:admin) }
  given(:user) { create(:user) }
  given!(:users) { create_list(:generate_user, 10) }

  scenario 'admin try view users list' do
    sign_in(admin)

    visit admin_users_path

    users.each do |user|
      expect(page).to have_content user.name
      expect(page).to have_content user.email
    end
  end

  scenario 'non admin user try view users' do
    sign_in(user)

    visit admin_users_path

    expect(page).to have_content 'You are not authorized to view this page.'

    users.each do |user|
      expect(page).to_not have_content user.name
      expect(page).to_not have_content user.email
    end
  end
end
