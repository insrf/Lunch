require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should allow_value('test@mail.ru').for(:email) }
  end

  let!(:users) { create_list(:generate_user, 2) }

  describe 'admin creating' do
    it 'first user should be change type to admin' do

      expect(users.first.admin?).to   be_truthy
      expect(users.second.admin?).to  be_falsey
    end
  end
end
