FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email { "test@test.com" }
    name { "MyString" }
    password { "MyString" }
  end

  factory :generate_user, class: "User" do
    email { generate(:email) }
    name { "MyString" }
    password { "MyString" }
  end
end
