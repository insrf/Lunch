require 'rails_helper'

feature 'Show orders', %q{
  As a Lunches Admin, on the date page I can see the list of orders and total lunch cost
  for today.
} do

  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:order) { create(:order, item_ids: [item.id], user_id: user.id, created_at: Time.now)}

  scenario 'Admin try view orders item' do
    sign_in(admin)
    visit showdate_admin_orders_path(date: Date.today)
    
    order.items.each do |item|
      expect(page).to have_content item.name
      expect(page).to have_content item.item_orders.sum(&:fix_price)
      expect(page).to have_content user.name
    end
  end

  scenario 'User try view orders item' do
    sign_in(user)
    visit showdate_admin_orders_path(Time.now.to_date)

    expect(page).to have_content 'You are not authorized to view this page.'

  end
end
