class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :menu_id, :item_id
  end
end
