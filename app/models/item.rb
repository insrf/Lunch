class Item < ApplicationRecord
  has_many :orders
  has_many :users, :through => :orders

  # self.inheritance_column = :foo
  validates :name, :course_type, :price, presence: true

  mount_uploader :photo, ImageUploader

  def start_time
    self.created_at
  end
end
