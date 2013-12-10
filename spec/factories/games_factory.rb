# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    admin_id 1
    location "Home"
    date 1898-10-10
    kind "Premier League"
  end
end
