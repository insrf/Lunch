require 'rails_helper'

feature 'List weekday', %q{
  As a user I can see a weekdays on the dashboard page
} do

  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  scenario 'Admin try add item menu' do
    sign_in(user)
    visit root_path

    (Time.now.beginning_of_month.to_i..Time.now.end_of_month.to_i).step(1.day) do |date|
      expect(page).to have_content Time.at(date).to_date
    end
  end
end
