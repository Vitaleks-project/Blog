# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voting do
    title "My Voting"
    admin_id 1
    current false
  end
end
