class Order < ApplicationRecord
  has_many :item_orders
  has_many :items, :through => :item_orders
  belongs_to :user

  def start_time
    self.created_at
  end
end
