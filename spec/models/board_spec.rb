require 'rails_helper'

RSpec.describe Board, type: :model do
  it "has a valid factory" do
    expect(create :board, :with_task).to be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Relations" do
    it {should have_many(:tasks)}
  end

end
