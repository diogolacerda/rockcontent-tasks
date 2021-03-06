require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(create :user).to be_valid
  end

  it { should have_secure_password }

  describe 'Validations' do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:login) }
  end

end
