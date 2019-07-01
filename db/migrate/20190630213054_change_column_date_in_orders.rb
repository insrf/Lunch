class ChangeColumnDateInOrders < ActiveRecord::Migration[5.2]
  def up
    remove_column :orders, :date
    add_column :orders, :date, :datetime
  end

  def down
    remove_column :orders, :date
    add_column :orders, :date, :time
  end
end
