require 'faker'
FactoryGirl.define do
  factory :trade_mark do
    name { Faker::Internet.name }
    status 1
  end
end

