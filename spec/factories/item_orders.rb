FactoryBot.define do
  factory :item_orders do
    user
    item
    fix_price { "9.99" }
  end
end
