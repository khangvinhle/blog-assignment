require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'facory data' do
    subject { build(:comment) }
    it { is_expected.to be_valid }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content).with_message('Please fill in the comment content!') }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end
