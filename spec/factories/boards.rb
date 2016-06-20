FactoryGirl.define do
  factory :board do
    name Faker::Hacker.say_something_smart

    is_private false

    trait :private do
      is_private true
    end

    trait :with_task do
      after(:create) do |instance|
        create_list :task, 1, board: instance
      end
    end

  end
end
