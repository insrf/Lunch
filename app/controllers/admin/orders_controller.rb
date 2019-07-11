class Admin::OrdersController < Admin::BaseAdminController

  def index
    @orders = Order.all
  end

  def showdate
    @orders = Order.where("created_at::date = ?", params[:date])
  end
end
