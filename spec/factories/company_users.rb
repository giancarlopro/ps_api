FactoryBot.define do
  factory :company_user do
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    request_change_password { false }
  end
end
