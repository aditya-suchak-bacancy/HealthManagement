FactoryBot.define do
  factory :remind do
    remid_type{Faker::Internet.name}
    remind_date{Date.today+rand(10000)}
    association :user
  end
end