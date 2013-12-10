# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :club do
    clubname "Manchester United"
    stadiumname "Old Trafford"
    coach "D.Moyes"
    year_of_foundation 1898-10-10
    sequence(:uniq_title){|n| "MU_#{n}"}
    description "Glory, Glory Man United"
    admin_id 1
  end
end
