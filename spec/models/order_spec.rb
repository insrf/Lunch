require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should have_many(:items).through(:item_orders)  }
    it { should belong_to(:user) }
  end

  describe 'validation' do
    it { should validate_presence_of(:item_ids) }

    let(:user) { create(:user) }
    let(:items) { create_list(:generate_items, 2) }
    let(:order) { create(:order, item_ids: [items[0].id], user_id: user.id) }

    context 'uniqueness of course type' do
      it 'should be valid' do
        expect(order).to be_valid
      end

      it 'should be invalid' do
        order.item_ids = [items[0].id, items[1].id]
        expect(order).to be_invalid
      end
    end
  end
end
