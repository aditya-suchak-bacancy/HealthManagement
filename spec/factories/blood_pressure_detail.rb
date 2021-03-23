#Date.today-rand(10000)
#Faker::Number.between(from: 1, to: 10)
FactoryBot.define do
  factory :blood_pressure_detail do
    s_blood_pressure {Faker::Number.between(from: 80, to: 120)}
    d_blood_pressure {Faker::Number.between(from: 90, to: 110)}
    blood_pressure_date {Date.today-rand(10000)}
    association :user
  end
end
