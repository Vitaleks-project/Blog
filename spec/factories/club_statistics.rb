# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :club_statistic do
    season_id 1
    admin_id 1
    club_id 1
    win 1
    draw 1
    lost 1
    played_games 1
    points 1
  end
end
