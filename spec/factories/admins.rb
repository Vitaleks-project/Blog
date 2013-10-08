# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email "admin@blog.com"
    password '12345678'
  end
end
