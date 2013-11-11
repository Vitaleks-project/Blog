# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "Cristiano"
    last_name "Ronaldo"
    birthday "10-15-1988"
    country "Portugal"
    club "Real Madrid"
    admin_id 1
    position "ФРВ"
    number 7
  end
end
