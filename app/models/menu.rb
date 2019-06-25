class Menu < ApplicationRecord
  self.inheritance_column = :foo
  validates :name, :type, :price, presence: true

  def start_time
    self.created_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
