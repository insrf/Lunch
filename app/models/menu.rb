class Menu < ApplicationRecord
  has_and_belongs_to_many :items
  has_many :orders
  has_many :users, :through => :orders
end
