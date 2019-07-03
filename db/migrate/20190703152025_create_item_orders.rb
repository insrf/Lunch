class CreateItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :item_orders do |t|
      t.belongs_to :item, index: true
      t.belongs_to :order, index: true
      t.decimal "fix_price", precision: 5, scale: 2
    end
  end
end
