require 'rails_helper'

feature 'Create order', %q{
  As a user, when I choose items from menu, I can only choose one item from the first
    course, one item from the main course and one drink. Total 3 items
} do

    let(:user) { create(:user) }
    let(:items) { create_list(:generate_items, 2) }
    let!(:menu) { create(:menu, item_ids: [items[0].id, items[1].id]) }

    scenario 'User makes an order' do
      go_order(user)

      page.check(items[0].name)
      click_on 'Create Order'

      expect(page).to have_content 'Your order successfully created.'
      expect(page).to have_content items[0].name
      expect(page).to have_content items[0].price
    end

    scenario 'User makes an order with two identical types items' do
      go_order(user)

      page.check(items[0].name)
      page.check(items[1].name)
      click_on 'Create Order'

      expect(page).to have_content 'You can order only one type course'
      expect(page).to have_content items[0].name
      expect(page).to have_current_path(orders_path)
    end

    scenario 'User makes an order without check items' do
      go_order(user)

      click_on 'Create Order'

      expect(page).to have_content "Item ids can't be blank"
      expect(page).to have_content items[0].name
      expect(page).to have_current_path(orders_path)
    end
  end
