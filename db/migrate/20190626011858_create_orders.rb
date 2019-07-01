class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :item
      t.references :user
      t.decimal :fix_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
