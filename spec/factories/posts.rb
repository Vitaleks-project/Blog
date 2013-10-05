# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :posts do
    title "MyString"
    text "MyText"
    user_id 1
  end
end
