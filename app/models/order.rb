class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def start_time
    self.created_at
  end
end
