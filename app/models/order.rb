class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :user

  def start_time
    self.date
  end
end
