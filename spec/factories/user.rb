x=Faker::Internet.password(min_length: 6)
FactoryBot.define do
  factory :user do
    username {Faker::Name.unique.name}
    name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password { "#{x}" }
    password_confirmation  { "#{x}" }
    dob {Date.today-100}
    gender {Faker::Gender.binary_type.downcase}
    weight {Faker::Number.decimal(l_digits:2,r_digits: 2)}
    height {Faker::Number.decimal(l_digits:1,r_digits: 2)}
  end
end
