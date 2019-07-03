class Menu < ApplicationRecord
  has_and_belongs_to_many :items

  def start_time
    self.created_at
  end
end
