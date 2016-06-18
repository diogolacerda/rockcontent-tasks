FactoryGirl.define do
  factory :task_status do
    name Faker::Lorem.characters(10)
  end
end
