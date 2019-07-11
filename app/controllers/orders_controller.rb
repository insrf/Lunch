class OrdersController < ApplicationController
  before_action :find_order, only: %i[show edit update destroy]
  before_action :find_menu, only: %i[new create edit update]

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
    @order = current_user.orders.build(order_params)
    @order.save_price

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
    params[:order][:item_ids] = params[:order][:item_ids].reject { |c| c.empty? }
    params.require(:order).permit(item_ids: [])
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def find_menu
    @menu = Menu.today.take!
  end
end
