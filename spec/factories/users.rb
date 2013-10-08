# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user@blog.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
