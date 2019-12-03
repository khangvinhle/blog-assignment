require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'factory data' do
    subject { build(:post) }
    it { is_expected.to be_valid }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
