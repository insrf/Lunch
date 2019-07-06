require 'rails_helper'

feature 'List orders and weekdays', %q{
  As a Lunches Admin, I can add items in menu only for today by adding a name and
  price.
} do

  let!(:admin) { create(:admin) }
  let!(:item) {create(:item) }

  scenario 'Admin try view orders item' do
    create_menu(admin, item)

    expect(page).to have_content 'Your menu successfully created.'
    expect(page).to have_content item.name
    expect(page).to have_content item.price
  end

  scenario 'Admin try create second menu on this date' do
    create(:menu, item_ids: [item.id])

    create_menu(admin, item)

    expect(page).to have_content "Created at isn't available on this date"
  end
end
