# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title "My first news"
    url "http://football.ua/"
    admin_id 1
  end
end
