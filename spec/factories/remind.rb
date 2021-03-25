x=rand(1..2)
y='blood_sugar'
if x==1
  y='blood pressure'
end
FactoryBot.define do
  factory :remind do
    remid_type{y}
    remind_date{Date.today+rand(10000)}
    association :user
  end
end