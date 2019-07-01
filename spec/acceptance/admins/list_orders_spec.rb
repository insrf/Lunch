require 'rails_helper'

feature 'List orders and weekdays', %q{
  As a Lunches Admin, I can browse days and see users’ orders there.
} do

  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let(:menu) {create(:menu) }
  let!(:order) { create(:order, menu_id: menu.id, user_id: user.id, date: Time.now )}

  scenario 'Admin try view orders menu' do
    sign_in(admin)
    visit admin_orders_path

    (Time.now.beginning_of_month.to_i..Time.now.end_of_month.to_i).step(1.day) do |date|
      expect(page).to have_content Time.at(date).to_date
      expect(page).to have_content user.name
      expect(page).to have_content menu.name
    end
  end

  scenario 'User try view orders menu' do
    sign_in(user)
    visit admin_orders_path

    expect(page).to have_content 'You are not authorized to view this page.'

  end
end
