FactoryGirl.define do
  factory :task do
    association :board
    association :priority_type
    association :task_status
    name Faker::Lorem.sentence(3)
  end
end
