require 'rails_helper'

feature 'List redirect to list menu', %q{
  As a user, when I click on the weekday(today or days in the past), I can see menu ­ list
  of items with prices.
} do

  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  scenario 'User try add order menu' do
    sign_in(user)
    visit root_path

    click_on 'Go order'

    expect(page).to have_content 'New Order'
    select(menu.name, :from => "order[menu_id]")
    click_on 'Create Order'

    expect(page).to have_content 'Your order successfully created.'

    expect(page).to have_content menu.id
    expect(page).to have_content menu.price
  end
end
