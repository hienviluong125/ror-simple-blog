require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    context 'create regular user' do
      let(:user) { FactoryBot.build(:user) }
      it { expect(user).to be_valid }
      it { expect(user.admin?).to be_falsey }
    end

    context 'create admin user' do
      let(:user) { FactoryBot.build(:user, :admin) }
      it { expect(user).to be_valid }
      it { expect(user.admin?).to be_truthy }
    end
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
  end
end
