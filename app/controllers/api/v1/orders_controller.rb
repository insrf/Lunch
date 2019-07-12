class Api::V1::OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :doorkeeper_authorize!

  def index
    @orders = Order.today
    render json: @orders
  end
end
