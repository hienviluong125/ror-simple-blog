require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'factory' do
    context 'create post' do
      let(:post) { FactoryBot.build(:post) }
      it { expect(post).to be_valid }
    end
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:thumbnail) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
