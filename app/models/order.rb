class Order < ApplicationRecord
  include ActiveModel::Validations

  has_many :item_orders
  has_many :items, :through => :item_orders
  belongs_to :user

  validate :validate_uniqueness_of_course_type
  validates :item_ids, presence: true

  def start_time
    self.created_at
  end

  def validate_uniqueness_of_course_type
    items_count = Item.where(id: item_ids).pluck(:course_type)
    if items_count != items_count.uniq
      errors.add(:base, "You can order only one type course")
    end
  end

  def only_one_order_in_day
    errors.add(:created_at, "isn't available on this date") if Order.today.exists?
  end
end
