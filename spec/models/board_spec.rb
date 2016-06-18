require 'rails_helper'

RSpec.describe Board, type: :model do
  it "has a valid factory" do
    expect(create :board).to be_valid
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end

  describe "Relations" do
    it {should belong_to(:user)}
    it {should have_many(:tasks)}
  end

end
