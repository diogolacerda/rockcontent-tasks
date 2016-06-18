FactoryGirl.define do
  factory :board do
    association :user
    name Faker::Hacker.say_something_smart

    is_private false

    trait :private do
      is_private true
    end

  end
end
