class Menu < ApplicationRecord
  self.inheritance_column = :foo
  validates :name, :type, :price, presence: true
end
