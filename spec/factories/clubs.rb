# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :club do
    clubname "MyString"
    stadiumname "MyString"
    coach "MyString"
    year_of_foundation 1
    logo "MyString"
    logo_stadium "MyString"
    uniq_title "MyString"
    description "MyString"
  end
end
