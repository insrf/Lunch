class RemoveColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :item_id, :bigint
    remove_column :orders, :fix_price, :decimal, precision: 5, scale: 2
  end
end
