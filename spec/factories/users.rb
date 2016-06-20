FactoryGirl.define do
  factory :user do
    login {Faker::Internet.user_name}
    password {Faker::Internet.password}
  end
end
