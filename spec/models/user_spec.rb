require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create :user).to be_valid
  end

  it { should have_secure_password }

  describe 'Validations' do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password) }
  end

  describe 'Relations' do
    it { should have_many(:boards) }
  end

end
