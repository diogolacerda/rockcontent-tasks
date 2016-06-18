require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(create :task).to be_valid
  end

  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:board)}
  end

  describe "Relations" do
    it {should belong_to(:board)}
    it {should belong_to(:priority_type)}
    it {should belong_to(:task_status)}
  end
end
