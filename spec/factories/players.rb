# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "MyString"
    last_name "MyString"
    birthday "MyString"
    country "MyString"
    club "MyString"
    admin_id 1
    photo "MyString"
    position "MyString"
    number 1
  end
end
