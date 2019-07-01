require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'associations' do
    it { should have_many(:users).through(:orders)  }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:course_type) }
    it { should validate_presence_of(:price) }
  end
end
