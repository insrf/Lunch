module OrdersHelper
  def total_order_price(orders)
    sum = 0
    orders.each do |order|
      sum += order.item_orders.sum(&:fix_price)
    end
    sum
  end
end
