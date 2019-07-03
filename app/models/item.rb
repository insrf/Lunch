class Item < ApplicationRecord
  has_and_belongs_to_many :menus
  has_many :orders
  has_many :users, :through => :orders

  validates :name, :course_type, :price, presence: true

  mount_uploader :photo, ImageUploader

end
