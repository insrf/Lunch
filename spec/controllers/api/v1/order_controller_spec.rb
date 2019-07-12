require 'rails_helper'

describe Api::V1::OrdersController do
  describe 'GET #index' do
    let(:token) { double :acceptable? => true }

    before do
      allow(controller).to receive(:doorkeeper_token) { token }
    end

    it 'responds with 200' do
      get :index, :format => :json
      response.status.should eq(200)
    end
  end
end
