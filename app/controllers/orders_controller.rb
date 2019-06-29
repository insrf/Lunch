class OrdersController < ApplicationController
  before_action :find_order , only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.date = Time.now
    @order.fix_price = Menu.find(order_params[:menu_id]).price
    if @order.save
      redirect_to @order, notice: 'Your order successfully created.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @orders
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:menu_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
