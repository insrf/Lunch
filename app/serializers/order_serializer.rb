class OrderSerializer < ActiveModel::Serializer
  attributes :id
  has_many :item_orders
  has_many :items, :through => :item_orders
  belongs_to :user
end
