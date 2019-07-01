FactoryBot.define do
  factory :order do
    item_id { 1 }
    user_id { 1 }
    fix_price { "9.99" }
  end
end
