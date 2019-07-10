FactoryBot.define do
  sequence :name do |n|
    "MyString#{n}"
  end

  factory :item do
    name { "MyString" }
    course_type { 1 }
    price { "9.99" }
    photo { "MyString" }
  end

  factory :generate_items, class: "Item" do
    name { generate(:name) }
    course_type { 1 }
    price { "9.99" }
    photo { "MyString" }
  end
end
