FactoryBot.define do
  factory :blood_sugar_detail do
    blood_sugar {Faker::Number.between(from: 80, to: 120)}
    blood_sugar_date {Date.today-rand(10000)}
    association :user
  end
end