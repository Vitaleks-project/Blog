# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    voting_id 1
    content "Questions?"
  end
end
