class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :course_type, null: false
      t.decimal :price, precision: 5, scale: 2
      t.string :photo

      t.timestamps
    end
  end
end
