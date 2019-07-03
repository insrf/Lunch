class OrdersController < ApplicationController
  before_action :find_order , only: %i[show edit update destroy]
  before_action :find_menu, only: %i[new]

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
    @order.fix_price = Item.find(order_params[:item_id]).price
    if @order.save
      redirect_to @order, notice: 'Your order successfully created.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path
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
    params.require(:order).permit(:item_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def find_menu
    @menu = Menu.find(params[:menu_id])
  end
end
